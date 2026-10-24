local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetBuildModelSelectionStoreModule = require(BuildExperience.Stores.GetBuildModelSelectionStore)
local _ = require(BuildExperience.Stores.GetBuildModelSelectionStore.createBuildModelSelectionStore)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)

return function(p1, p2, p3, p4, Enabled, InternalTesting)
	-- upvalues: GetBuildModelSelectionStoreModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local BuildModelSelectionStoreModule = GetBuildModelSelectionStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p3 (copy), p1 (copy), BuildModelSelectionStoreModule (copy), p2 (copy)
		return SignalsModule.createComputed(function(p5)
			-- upvalues: p3 (upval), p1 (upval), BuildModelSelectionStoreModule (upval), p2 (upval)
			return if p3 == nil then if p1 == nil or p1 <= 0 then if p2 == nil then nil else BuildModelSelectionStoreModule.getDraft(p2, p5) else BuildModelSelectionStoreModule.getUniverse(p1, p5) else nil
		end)
	end, { BuildModelSelectionStoreModule, p1, p2, p3 })))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseSignalStateResult (copy)
		return SignalsModule.createComputed(function(p5)
			-- upvalues: UseSignalStateResult (upval)
			return if UseSignalStateResult == nil then nil else UseSignalStateResult.getSelection(p5)
		end)
	end, { UseSignalStateResult })))
	local UseResult = ReactModule.useCallback(function(p5)
		-- upvalues: UseSignalStateResult (copy), InternalTesting (copy)
		if UseSignalStateResult ~= nil and (p5 == "default" or p5 == "advanced") and UseSignalStateResult.selectTier(p5) and InternalTesting ~= nil and InternalTesting.onExit ~= nil then
			InternalTesting.onExit()
		end
	end, { UseSignalStateResult, InternalTesting })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p4 (copy), Enabled (copy)
		local Options = {}
		
		for _, Id in { "default", "advanced" } do
			local config = {
				id = Id,
				model = if Id == "default" then "Default" else "Advanced",
				isAvailable = p4 == nil and (Id == "default" or Enabled ~= true),
				isAvailabilityConfirmed = p4 ~= nil or Enabled == true
			}
			
			if p4 ~= nil then
				for _, value in p4.available do
					if value.id == Id then
						config.isAvailable = true
						config.rateMultiplier = value.rateMultiplier
					end
				end
			end
			table.insert(Options, config)
		end
		return { options = Options }
	end, { p4, Enabled })
	
	return ReactModule.useMemo(function()
		-- upvalues: p3 (copy), UseSignalStateResult1 (copy), InternalTesting (copy), UseMemoResult (copy), UseResult (copy)
		return if p3 == nil then if UseSignalStateResult1 == nil then nil else {
			internalTesting = InternalTesting,
			data = UseMemoResult,
			selectedId = UseSignalStateResult1.intendedTier,
			isDisabled = UseSignalStateResult1.isBusy,
			onSelect = UseResult
		} else p3
	end, {
		p3,
		UseSignalStateResult1,
		UseResult,
		UseMemoResult,
		InternalTesting
	})
end