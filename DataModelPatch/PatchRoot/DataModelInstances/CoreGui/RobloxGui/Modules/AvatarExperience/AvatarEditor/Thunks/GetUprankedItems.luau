local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local SetRemoteUprankedItemsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetRemoteUprankedItems)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)

local function _(p1)
	-- upvalues: SetRemoteUprankedItemsModule (copy)
	local UprankedItems = p1.uprankedItems
	local ResolveFunction = p1.resolve
	local Store = p1.store
	
	if UprankedItems and #UprankedItems ~= 0 then
		Store:dispatch(SetRemoteUprankedItemsModule(UprankedItems))
		ResolveFunction()
		
		return
	else
		return ResolveFunction()
	end
end

local function fetchItems(p1)
	-- upvalues: WebApiModule (copy), SetRemoteUprankedItemsModule (copy)
	return WebApiModule.GetRemoteUpranked(p1.networkImpl, p1.userId):andThen(function(Result)
		-- upvalues: p1 (copy), SetRemoteUprankedItemsModule (upval)
		local config = {
			networkImpl = p1.networkImpl,
			uprankedItems = Result.responseBody.outfitDetails,
			store = p1.store,
			resolve = p1.resolve
		}
		local UprankedItems = config.uprankedItems
		local ResolveFunction = config.resolve
		local Store = config.store
		
		if UprankedItems and #UprankedItems ~= 0 then
			Store:dispatch(SetRemoteUprankedItemsModule(UprankedItems))
			ResolveFunction()
			
			return
		else
			local _ = ResolveFunction()
		end
	end):catch(function(Err)
		-- upvalues: p1 (copy)
		warn("GetRemoteUpranked failure: ", Err)
		
		return p1.reject(Err)
	end)
end

return function(NetworkImpl)
	-- upvalues: UtilsModule (copy), PromiseModule (copy), fetchItems (copy)
	return function(Store)
		-- upvalues: UtilsModule (upval), PromiseModule (upval), fetchItems (upval), NetworkImpl (copy)
		local UserId = UtilsModule.getUserId((Store:getState()))
		
		return PromiseModule.new(function(Resolve, Reject)
			-- upvalues: fetchItems (upval), NetworkImpl (upval), UserId (copy), Store (copy)
			fetchItems({
				networkImpl = NetworkImpl,
				userId = UserId,
				store = Store,
				resolve = Resolve,
				reject = Reject
			})
		end)
	end
end