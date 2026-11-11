local Parent = script.Parent.Parent.Parent
local CryoModule = require(Parent.Cryo)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(ItemId)
	-- upvalues: AppPage (copy), CryoModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return function(p1)
		-- upvalues: ItemId (copy), AppPage (upval), CryoModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		local Text = "Asset" .. ItemId
		local config = {
			name = AppPage.AvatarExperienceWrapper,
			detail = Text,
			extraProps = {
				routeName = "ItemDetails",
				params = CryoModule.Dictionary.join({
					fromContentFeed = true,
					itemType = "Asset",
					mountAnimation = false,
					mountAsFullView = true,
					itemDetailsPeekViewRefs = {},
					itemId = ItemId
				}, { detail = Text })
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownFunction(config))
		end
	end
end