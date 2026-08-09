local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local _ = require(script.Parent.Parent.Enums.Categories)
local _ = require(script.Parent.Parent.Enums.ScreenLayout)
local _ = require(script.Parent.Parent.Enums.ItemView)
local _ = require(script.Parent.Parent.Stores.createCategoryInventoryStore)
local _ = require(script.Parent.Parent.Stores.createSortAndFiltersStore)
local _ = require(script.Parent.Parent.Stores.createSlotBasedEditorStore)
local _ = require(script.Parent.Parent.Types)

return require(parent.React).createContext(nil)