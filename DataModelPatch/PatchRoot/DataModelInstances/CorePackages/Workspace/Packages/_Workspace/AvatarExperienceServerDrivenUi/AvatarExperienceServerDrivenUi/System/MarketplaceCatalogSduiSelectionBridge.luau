local Logging = require(script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent.AppCommonLib).Logging
local Config = nil
local List = {}

return {
	register = function(OwnerId, Handlers)
		-- upvalues: Config (ref)
		Config = { ownerId = OwnerId, handlers = Handlers }
	end,
	unregister = function(OwnerId)
		-- upvalues: Config (ref)
		if Config and Config.ownerId == OwnerId then
			Config = nil
		end
	end,
	registerFocusedSortHandler = function(OwnerId, Handler)
		-- upvalues: List (copy)
		for i, value in List do
			if value.ownerId == OwnerId then
				List[i] = { ownerId = OwnerId, handler = Handler }
				
				return
			end
		end
		table.insert(List, { ownerId = OwnerId, handler = Handler })
	end,
	unregisterFocusedSortHandler = function(OwnerId)
		-- upvalues: List (copy)
		for i, value in List do
			if value.ownerId == OwnerId then
				table.remove(List, i)
				break
			end
		end
	end,
	selectCategory = function(p1)
		-- upvalues: Config (ref)
		if Config and Config.handlers then
			Config.handlers.selectCategory(p1)
		end
	end,
	selectSubcategory = function(p1)
		-- upvalues: Config (ref)
		if Config and Config.handlers then
			Config.handlers.selectSubcategory(p1)
		end
	end,
	requestFocusedSort = function(p1)
		-- upvalues: List (copy), Logging (copy)
		local Entry = List[#List]
		
		if Entry then
			Entry.handler(p1)
			
			return
		else
			Logging.warn("MarketplaceCatalogSduiSelectionBridge.requestFocusedSort: " .. "no focused-sort handler registered for sortId=" .. tostring(p1 and p1.sortId) .. "; SDUI See All button will appear dead.")
		end
	end
}