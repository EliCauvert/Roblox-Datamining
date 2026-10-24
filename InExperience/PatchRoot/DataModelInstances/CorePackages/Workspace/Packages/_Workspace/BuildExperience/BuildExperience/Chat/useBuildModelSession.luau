local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local GetBuildModelSelectionStoreModule = require(BuildExperience.Stores.GetBuildModelSelectionStore)
local _ = require(BuildExperience.Stores.GetBuildModelSelectionStore.createBuildModelSelectionStore)

return function(p1, p2, p3)
	-- upvalues: GetBuildModelSelectionStoreModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local BuildModelSelectionStoreModule = GetBuildModelSelectionStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), BuildModelSelectionStoreModule (copy), p2 (copy)
		return SignalsModule.createComputed(function(p4)
			-- upvalues: p1 (upval), BuildModelSelectionStoreModule (upval), p2 (upval)
			return if p1 == nil or p1 <= 0 then if p2 == nil then nil else BuildModelSelectionStoreModule.getDraft(p2, p4) else BuildModelSelectionStoreModule.getUniverse(p1, p4)
		end)
	end, { BuildModelSelectionStoreModule, p1, p2 })))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseSignalStateResult (copy), p3 (copy)
		return SignalsModule.createComputed(function(p4)
			-- upvalues: UseSignalStateResult (upval), p3 (upval)
			return if UseSignalStateResult == nil or UseSignalStateResult.getSelection(p4) == nil or p3 == nil then nil else p3.getModels(p4)
		end)
	end, { UseSignalStateResult, p3 })))
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseSignalStateResult (copy)
		return SignalsModule.createComputed(function(p4)
			-- upvalues: UseSignalStateResult (upval)
			local Selection = if UseSignalStateResult == nil then nil else UseSignalStateResult.getSelection(p4)
			
			return Selection ~= nil and Selection.isBusy
		end)
	end, { UseSignalStateResult })))
	local UseSignalStateResult3 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p3 (copy)
		return SignalsModule.createComputed(function(p4)
			-- upvalues: p3 (upval)
			return p3 ~= nil and p3.hasObservedModels(p4)
		end)
	end, { p3 })))
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy)
		if UseSignalStateResult ~= nil and UseSignalStateResult1 ~= nil then
			UseSignalStateResult.restoreTier(UseSignalStateResult1.current)
		end
	end, { UseSignalStateResult, UseSignalStateResult1 })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), UseSignalStateResult2 (copy), UseSignalStateResult3 (copy)
		return {
			entry = UseSignalStateResult,
			models = UseSignalStateResult1,
			isBusy = UseSignalStateResult2,
			hasObservedModels = UseSignalStateResult3
		}
	end, {
		UseSignalStateResult,
		UseSignalStateResult1,
		UseSignalStateResult2,
		UseSignalStateResult3
	})
end