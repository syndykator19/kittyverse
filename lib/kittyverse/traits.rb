# encoding: utf-8


class Trait

  def self.traits_by_name()  @@traits_by_name ||= {}; end
  def self.traits_by_code()  @@traits_by_code ||= {}; end

  def self.find_by_code( code )
    ## note: allow string AND symbols (thus, use .to_s)
    ##  e.g. allow 'FU01', 'fu01', :fu01, :FU01, etc.
    @@traits_by_code[ code.upcase.to_s ]
  end

  ALT_TRAIT_NAMES =
  {
    'totesbasic (14)' => 'totesbasic 1',
    'totesbasic (15)' => 'totesbasic 2',
    'totesbasic (23)' => 'totesbasic 3',
    'totesbasic_14'   => 'totesbasic 1',
    'totesbasic_15'   => 'totesbasic 2',
    'totesbasic_23'   => 'totesbasic 3',
    'totesbasic (f)'  => 'totesbasic 1',
    'totesbasic (g)'  => 'totesbasic 2',
    'totesbasic (p)'  => 'totesbasic 3',
    'totesbasic_f'    => 'totesbasic 1',
    'totesbasic_g'    => 'totesbasic 2',
    'totesbasic_p'    => 'totesbasic 3',
    'totesbasic_1'    => 'totesbasic 1',
    'totesbasic_2'    => 'totesbasic 2',
    'totesbasic_3'    => 'totesbasic 3',
  }
    
  def self.find_by_name( name )
    ## note: allow string AND symbols (thus, use .to_s !!!)
    ## note: downcase name e.g. allow Savannah too (not just savannah)

    name = name.to_s.downcase 
    name = ALT_TRAIT_NAMES[ name ]  if ALT_TRAIT_NAMES[ name ]

    @@traits_by_name[ name ]
  end

  ## add "generic" convenience find helper
  def self.find_by( **kwargs )
    if kwargs[ :name ]
       find_by_name( kwargs[ :name ] )
    elsif kwargs[ :code ]
      find_by_code( kwargs[ :code] )
    else
      ## todo/fix: throw argument except!!!
      nil
    end
  end



  attr_accessor :type,
                :name,
                :kai     # kai char e.g. '1', '2', etc.

  def initialize( **kwargs )
    update( kwargs )
  end

  def update( **kwargs )
    kwargs.each do |name,value|
      send( "#{name}=", value ) ## use "regular" plain/classic attribute setter
    end
    self   ## return self for chaining
  end

  def num()   Kai::NUMBER[@kai]; end
  def code()  @type.code + Kai::CODE[@kai]; end
end  # class Trait



class TraitType

  def self.trait_types_by_key()  @@trait_types_by_key ||= {}; end
  def self.trait_types_by_code() @@trait_types_by_code ||= {}; end
  def self.trait_types_by_name() @@trait_types_by_name ||= {}; end

  # quick hack - map copycats keys to (internal) cryptokitties trait type keys
  #  note: all keys are the same except:
  ALT_TRAIT_TYPE_KEYS =
  {
    :color1    => :colorprimary,
    :color2    => :colorsecondary,
    :color3    => :colortertiary,
    :purrstige => :prestige,
    ## add :fur, etc. too - why? why not?
  }


  def self.find_by_key( key )
    ## note: allow string AND symbols (thus, use .to_sym !!!)
    ## note: allow  known alternative mappings/key (e.g. "internal" cryptokitties keys if different)
    key = key.to_sym
    key = ALT_TRAIT_TYPE_KEYS[ key ]  if ALT_TRAIT_TYPE_KEYS[ key ]

    @@trait_types_by_key[ key]
  end

  def self.find_by_code( code )
    ## note: allow string AND symbols (thus, use .to_s)
    ##  e.g. allow 'FU', 'fu', :fu, :FU, etc.
    code = code.to_s.upcase
    @@trait_types_by_code[ code ]
  end

  ALT_TRAIT_TYPE_NAMES =
  {
    'body'             => 'fur',
    'eyes'             => 'eye shape',
    'eye type'         => 'eye shape',
    'body color'       => 'base color',
    'primary color'    => 'base color',
    'base colour'      => 'base color',       # british (canadian) spelling
    'secondary color'  => 'highlight color',
    'sec color'        => 'highlight color',
    'pattern color'    => 'highlight color',
    'highlight colour' => 'highlight color',  # british (canadian) spelling
    'tertiary color'   => 'accent color',
    'accent colour'    => 'accent color',     # british (canadian) spelling
    'wild'             => 'wild element',
    'secret'           => 'secret y gene',
    'prestige'         => 'purrstige',
  }

  def self.find_by_name( name )
    ## note: downcase name e.g. allow fur too (not just Fur)
    ## note: allow  known alternative mappings/key (e.g. "internal" cryptokitties keys if different)
    name = name.to_s.downcase
    name = ALT_TRAIT_TYPE_NAMES[ name ]  if ALT_TRAIT_TYPE_NAMES[ name ]

    @@trait_types_by_name[ name ]
  end


  ## add "generic" convenience find helper
  def self.find_by( **kwargs )
    if kwargs[ :key ]
       find_by_key( kwargs[ :key ] )
    elsif kwargs[ :code ]
       find_by_code( kwargs[ :code ] )
     elsif kwargs[ :name ]
        find_by_name( kwargs[ :name ] )
    else
      ## todo/fix: throw argument except!!!
      nil
    end
  end

  def self.each
    @@trait_types_by_key.each do |(key,type)|
      yield( type )
    end
  end

  def self.each_with_index
    @@trait_types_by_key.each_with_index do |(key,type),i|
      yield( type,i )
    end
  end


  attr_accessor :key,
                :name,
                :code,
                :genes,
                :traits,      ## array of 32 traits
                :cattributes  ## array of 29/31/x cattributes

  def initialize( **kwargs )
    update( kwargs )
  end

  def update( **kwargs )
    kwargs.each do |name,value|
      send( "#{name}=", value ) ## use "regular" plain/classic attribute setter
    end
    self   ## return self for chaining
  end

  def [](key)
    if key.is_a? Integer   ## assume 0,1,2,3,.. index
      traits[ key ]
    elsif key.size == 2 && key =~ /^[0-9]{2}$/   ## assume code e.g. '00', '01', .. etc.
      traits[ key.to_i(10) ]
    else   ## assume kai char
      traits[ Kai::NUMBER[key] ]
    end
  end


  TRAITS.reduce( TraitType.trait_types_by_key ) do |types, (key, h)|

   type = TraitType.new(
     key:   key,
     name:  h[:name],    # e.g. 'Fur'
     code:  h[:code],    # e.g. 'FU'
     genes: h[:genes]    # e.g. '0-3'
   )

   # auto-fill kai mapping
   ## note: to keep "insertion" order - recreate new hash mapping
   hash_kai  = h[:kai]
   hash_kai2 = {}
   Kai::ALPHABET.each do |kai|
     name = hash_kai[kai]
     if name.nil?
       ## puts "#{key} - #{kai} is missing"
       ## hash_kai2[kai] = "#{key}_#{kai}"
       hash_kai2[kai] = nil
     elsif name.empty?
       ## puts "#{key} - #{kai} is empty"
       ## hash_kai2[kai] = "#{key}_#{kai}"
       hash_kai2[kai] = nil
     else
       hash_kai2[kai] = name
     end
   end
   h[:kai] = hash_kai2

   type.traits = h[:kai].reduce([]) do |traits, (kai,name)|   # array of 32 traits
     trait = Trait.new(
       type: type,
       name: name,
       kai:  kai
     )

     ## (auto-)add traits for lookup by name, code, etc. via (hash) mapping
     Trait.traits_by_name[ trait.name.downcase ] = trait    if trait.name  ## note: traits without name (nil) exist!!
     Trait.traits_by_code[ trait.code ]          = trait

     traits << trait
     traits
   end

   types[key] = type
   types
 end

 TraitType.trait_types_by_key.reduce( TraitType.trait_types_by_code ) do |types, (key, type)|
   types[type.code] = type
   types
 end

 TraitType.trait_types_by_key.reduce( TraitType.trait_types_by_name ) do |types, (key, type)|
   ## note: downcase Fur to fur and so on (for case insensitive match)
   types[type.name.downcase] = type
   types
 end

end  # class TraitType




class Traits
  def self.[]( key )

   ## todo:
   ##   add lookup trait type by alt_names (string)
   ##   add lookup trait type by alt_keys (symbol)

    ## check for codes e.g. FU, PA, ... (or fu, pa,...).
    if key.size == 2 && key =~ /^[A-Za-z]{2}$/
      TraitType.find_by_code( key )
    ## check for codes e.g. FU00, FU01 ... (or fu00, fu01, ...)
    elsif key.size == 4 && key =~ /^[A-Za-z]{2}[0-9]{2}$/
      Trait.find_by_code( key )
    else
      if key.is_a? Symbol    ## e.g. :body, :pattern, etc.
        t = TraitType.find_by_key( key )
        t = Trait.find_by_name( key )      if t.nil?  ## try trait name next - why? why not?
        t
      else ## assume string
        t = TraitType.find_by_name( key )
        t = Trait.find_by_name( key )      if t.nil?  ## try trait name next
        t
      end
    end
  end

  def self.each() TraitType.each { |type| yield(type) }; end
  def self.each_with_index() TraitType.each_with_index { |type,i| yield(type,i) }; end
end  # class Traits
