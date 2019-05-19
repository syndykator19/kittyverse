# encoding: utf-8

## 31 colors body
COLORS_BODY = {
 meowgarine:      "#fcfc95",
 cornflower:      "#7592fc",
 icicle:          "#c5e2ff",
 hotcocoa:        "#5e4a47",
 firstblush:      "#fcd0f8",
 tundra:          "#dbccbf",
 glacier:         "#ccffff",
 hyacinth:        "#a45de2",
 shamrock:        "#50c878",
 shadowgrey:      "#b1b1be",
 salmon:          "#f4a792",
 orangesoda:      "#f7bc56",
 cottoncandy:     "#ecd1eb",
 mauveover:       "#ded0ee",
 aquamarine:      "#add5d2",
 nachocheez:      "#fcda86",
 harbourfog:      "#afb4d5",
 cinderella:      "#5ab0f1",
 greymatter:      "#d1dadf",
 brownies:        "#b78662",
 dragonfruit:     "#ec79f2",
 hintomint:       "#d0ead2",
 bananacream:     "#f8f8e0",
 cloudwhite:      "#ffffff",
 oldlace:         "#ffebe9",
 koala:           "#85828a",
 lavender:        "#bc99ff",
 redvelvet:       "#f77272",
 verdigris:       "#73ffc3",
 onyx:            "#42414c",
 martian:         "#a4ff6f"
}

## 31 colors eyes
COLORS_EYES = {
 olive:           "#729100",
 pinefresh:       "#177a25",
 oasis:           "#ccffef",
 dioscuri:        "#0ba09c",
 isotope:         "#e4ff73",
 bridesmaid:      "#ffc2df",
 downbythebay:    "#83b293",
 gemini:          "#ffd150",
 kaleidoscope:    "#bcba5e",
 thundergrey:     "#828282",
 gold:            "#fcdf35",
 topaz:           "#0ba09c",
 mintgreen:       "#43edac",
 sizzurp:         "#7c40ff",
 chestnut:        "#a56429",
 strawberry:      "#ef4b62",
 sapphire:        "#4c7aef",
 forgetmenot:     "#4eb4f9",
 dahlia:          "#b8bdff",
 coralsunrise:    "#ff9088",
 doridnudibranch: "#fa9fff",
 parakeet:        "#49b749",
 cyan:            "#45f0f4",
 pumpkin:         "#ffa039",
 limegreen:       "#aef72f",
 bubblegum:       "#ef52d1",
 twilightsparkle: "#ba8aff",
 palejade:        "#c3d8cf",
 eclipse:         "#484c5b",
 babypuke:        "#bcba5e",
 autumnmoon:      "#ffe8bb"
}

## 31 colors secondary
COLORS_SECONDARY = {
 cyborg:          "#959cae",
 ooze:            "#daea31",
 peppermint:      "#00a86b",
 inflatablepool:  "#4fb9c5",
 prairierose:     "#e0115f",
 springcrocus:    "#ab7fef",
 egyptiankohl:    "#4a4855",
 poisonberry:     "#773c5f",
 lilac:           "#e5e5f9",
 apricot:         "#f4a45b",
 royalpurple:     "#cf5be8",
 padparadscha:    "#ffd5c7",
 swampgreen:      "#44e192",
 violet:          "#765be8",
 scarlet:         "#ea5f5a",
 barkbrown:       "#886662",
 coffee:          "#756650",
 lemonade:        "#ffef85",
 chocolate:       "#c47e33",
 butterscotch:    "#ffce6c",
 safetyvest:      "#b0f852",
 turtleback:      "#387573",
 rosequartz:      "#ffaefb",
 wolfgrey:        "#737184",
 cerulian:        "#385877",
 skyblue:         "#83d5ff",
 garnet:          "#f4679a",
 universe:        "#494981",
 royalblue:       "#5b6ee8",
 mertail:         "#36f2bc",
 pearl:           "#fff8fa"
}

## 31 colors tertiary
COLORS_TERTIARY = {
 hanauma:         "#7accb5",
 belleblue:       "#afd0f7",
 peach:           "#f9cfad",
 granitegrey:     "#b1aeb9",
 kittencream:     "#f7ebda",
 emeraldgreen:    "#8be179",
 bloodred:        "#ff7a7a",
 daffodil:        "#fff09f",
 sandalwood:      "#b8916c",
 icy:             "#eef8f8",
 flamingo:        "#ec87ba",
 seafoam:         "#9eeec5",
 azaleablush:     "#ffccd8",
 morningglory:    "#887cff",
 purplehaze:      "#dad6e1",
 missmuffett:     "#f4b3f0",
 summerbonnet:    "#cbb0ff",
 mallowflower:    "#c170b1",
 fallspice:       "#ff9331",
 dreamboat:       "#fd6cd5",
 periwinkle:      "#cacaff",
 frosting:        "#ffdce6",
 patrickstarfish: "#ffad97",
 mintmacaron:     "#b0f1f4",
 shale:           "#585666",
 cashewmilk:      "#f9efef",
 buttercup:       "#f4e65d",
 cobalt:          "#5262db",
 sully:           "#70f9f9",
 kalahari:        "#ffcf8a",
 atlantis:        "#2a7f96"
}

COLORS = {}.merge( COLORS_BODY )
           .merge( COLORS_EYES )
           .merge( COLORS_SECONDARY )
           .merge( COLORS_TERTIARY )
