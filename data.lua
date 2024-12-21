local tile = table.deepcopy(data.raw["tile"]["grass-1"])
tile.name = "artificial-tree-soil"
tile.minable = {mining_time = 0.5, result = "artificial-tree-soil"}
tile.mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg", volume = 0.8}
tile.map_color={55, 70, 11}
tile.is_foundation = true

local item = table.deepcopy(data.raw.item["artificial-jellynut-soil"])
item.name= "artificial-tree-soil"
item.place_as_tile.result = "artificial-tree-soil"
item.place_as_tile.condition_size = 1
item.place_as_tile.tile_condition = nil
item.place_as_tile.condition.layers = {}
item.icons = {
  {
    icon = item.icon,
    icon_size = item.icon_size,
    tint = {r=0,g=1,b=0,a=0.3}
  },
}

local recipe = {
  type = "recipe",
  name = "artificial-tree-soil",
  category = "crafting",
  enabled = false,
  allow_productivity = true,
  energy_required = 2,
  ingredients = {
    {type = "item", name = "tree-seed", amount = 2},
    {type = "item", name = "nutrients", amount = 50},
    {type = "item", name = "landfill", amount = 5}
  },
  results = {{type = "item", name = "artificial-tree-soil", amount = 10}}
}

-- Ensure that trees can be planed on oir artificial soil
local tree_plant = data.raw["plant"]["tree-plant"]
table.insert(tree_plant.autoplace.tile_restriction, "artificial-tree-soil")

-- Ensure our soil is unlocked at the same time as the other artificial soils
local research = data.raw["technology"]["artificial-soil"]
table.insert(research.effects, { type = "unlock-recipe", recipe="artificial-tree-soil"})

data:extend{tile, item, recipe}