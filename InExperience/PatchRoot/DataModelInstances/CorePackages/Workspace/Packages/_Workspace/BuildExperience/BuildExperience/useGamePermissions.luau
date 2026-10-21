local Parent = script:FindFirstAncestor("BuildExperience").Parent
local GamePermissionsModule = require(Parent.DataHydration.GamePermissions)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Frozen = table.freeze({
	canEdit = false,
	canEditOnBuild = false,
	canPublish = false,
	canMonetize = false,
	canViewAnalytics = false,
	canPreview = true,
	canAdvertise = false,
	canViewOnCreatorHub = true
})
local Frozen1 = table.freeze({
	isLoading = false,
	permissions = table.freeze({
		canEdit = true,
		canEditOnBuild = true,
		canPublish = true,
		canMonetize = true,
		canViewAnalytics = true,
		canPreview = true,
		canAdvertise = true,
		canViewOnCreatorHub = true
	})
})
local Frozen2 = table.freeze({ isLoading = false, permissions = Frozen })
local Frozen3 = table.freeze({ isLoading = true, permissions = Frozen })

return function(p1)
	-- upvalues: GamePermissionsModule (copy), ReactModule (copy), SignalsModule (copy), Frozen1 (copy), Frozen2 (copy), Frozen3 (copy), SignalsReactModule (copy)
	local GamePermissionsStore = p1.gamePermissionsStore or GamePermissionsModule.getGamePermissionsStore()
	local UniverseId = p1.universeId
	local IsIsNewGame = p1.isNewGame == true
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), IsIsNewGame (copy), UniverseId (copy), Frozen1 (upval), GamePermissionsStore (copy), Frozen2 (upval), Frozen3 (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: IsIsNewGame (upval), UniverseId (upval), Frozen1 (upval), GamePermissionsStore (upval), Frozen2 (upval), Frozen3 (upval)
			if IsIsNewGame or UniverseId == nil or UniverseId == 0 then
				return Frozen1
			else
				local AndFetchUniversePermissions = GamePermissionsStore.getAndFetchUniversePermissions(UniverseId)
				local DataResult = AndFetchUniversePermissions.data(p2)
				
				return if DataResult == nil then if AndFetchUniversePermissions.status(p2) == "Failed" then Frozen2 else Frozen3 else { isLoading = false, permissions = DataResult }
			end
		end)
	end, { GamePermissionsStore, UniverseId, IsIsNewGame })))
	
	return UseSignalStateResult.permissions, UseSignalStateResult.isLoading
end