local artificialGrassTile = table.deepcopy(data.raw["tile"]["grass-1"])
artificialGrassTile.name = "artificial-tree-soil"
artificialGrassTile.minable = {mining_time = 0.5, result = "artificial-tree-soil"}
artificialGrassTile.mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg", volume = 0.8}
artificialGrassTile.map_color={55, 70, 11}
artificialGrassTile.is_foundation = true

local artificialGrassItem = table.deepcopy(data.raw.item["artificial-jellynut-soil"])
artificialGrassItem.name= "artificial-tree-soil"
artificialGrassItem.place_as_tile.result = "artificial-tree-soil"
artificialGrassItem.place_as_tile.condition_size = 1
artificialGrassItem.place_as_tile.tile_condition = nil
artificialGrassItem.place_as_tile.condition.layers = {}
artificialGrassItem.icons = {
  {
    icon = artificialGrassItem.icon,
    icon_size = artificialGrassItem.icon_size,
    tint = {r=0,g=1,b=0,a=0.3}
  },
}

local tree_plant = data.raw["plant"]["tree-plant"]
table.insert(tree_plant.autoplace.tile_restriction, "artificial-tree-soil")

-- create the recipe prototype from scratch
local recipe = {
  type = "recipe",
  name = "artificial-tree-soil",
  enabled = true,
  energy_required = 8, -- time to craft in seconds (at crafting speed 1)
  ingredients = {
    {type = "item", name = "copper-plate", amount = 200},
    {type = "item", name = "steel-plate", amount = 50}
  },
  results = {{type = "item", name = "artificial-tree-soil", amount = 1}}
}

data:extend{artificialGrassTile, artificialGrassItem, recipe}