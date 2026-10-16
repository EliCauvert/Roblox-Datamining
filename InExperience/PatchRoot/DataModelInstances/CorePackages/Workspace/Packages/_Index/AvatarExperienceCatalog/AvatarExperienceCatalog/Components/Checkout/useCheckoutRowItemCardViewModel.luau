local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local _ = require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)
local UseTimedOptionsFtuxModule = require(AvatarExperienceCatalog.Hooks.useTimedOptionsFtux)
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird
local FFlagAXDurables2Option = require(Parent.AvatarExperienceFlags).FFlagAXDurables2Option
local _2OptionOfferPillTooltipTimeout = game:DefineFastInt("2OptionOfferPillTooltipTimeout", 5)

return function(p1) --[[ Line: 19 | Named "useCheckoutRowItemCardViewModel" ]]
	-- upvalues: ReactModule (copy), FFlagAXMISWithBlackbird (copy), FFlagAXDurables2Option (copy), UseTimedOptionsFtuxModule (copy), _2OptionOfferPillTooltipTimeout (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 20 ]]
		-- upvalues: p1 (copy)
		if p1.timedOptions then
			for _, timedOption in p1.timedOptions do
				if timedOption.selected then
					return timedOption.price
				end
			end
		end
		return nil
	end)
	ReactModule.useEffect(function() --[[ Line: 32 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), FFlagAXMISWithBlackbird (upval)
		if p1.selectedTimedOptionIndexInReducer == nil then
			if FFlagAXMISWithBlackbird and p1.timedOptions then
				for _, timedOption in p1.timedOptions do
					if timedOption.selected then
						UseStateResult2(timedOption.price)
						break
					end
				end
			end
		else
			local TimedOption = p1.timedOptions and p1.timedOptions[p1.selectedTimedOptionIndexInReducer]
			
			if TimedOption then
				UseStateResult2(TimedOption.price)
				
				return
			end
		end
	end, {
		p1.selectedTimedOptionIndexInReducer,
		if FFlagAXMISWithBlackbird then p1.timedOptions else nil
	})
	local v1 = nil
	local UseStateResult2_1 = nil
	
	if FFlagAXDurables2Option then
		local UseTimedOptionsFtuxModuleResult = UseTimedOptionsFtuxModule()
		v1, UseStateResult2_1 = ReactModule.useState(UseTimedOptionsFtuxModuleResult.shouldShow2OptionOfferPillTooltip())
		ReactModule.useEffect(function() --[[ Line: 60 ]]
			-- upvalues: v1 (ref), _2OptionOfferPillTooltipTimeout (upval), UseStateResult2_1 (ref), UseTimedOptionsFtuxModuleResult (copy)
			local DelayedThread = if v1 then task.delay(_2OptionOfferPillTooltipTimeout, function() --[[ Line: 62 ]]
				-- upvalues: UseStateResult2_1 (upval), UseTimedOptionsFtuxModuleResult (upval)
				UseStateResult2_1(false)
				UseTimedOptionsFtuxModuleResult.hide2OptionOfferPillTooltip()
			end) else nil
			
			return function() --[[ Line: 68 ]]
				-- upvalues: DelayedThread (copy)
				if DelayedThread then
					task.cancel(DelayedThread)
				end
			end
		end, { v1, UseStateResult2_1, UseTimedOptionsFtuxModuleResult })
	end
	return {
		selectedTimedOptionPrice = UseStateResult,
		setSelectedTimedOptionPrice = UseStateResult2,
		showOfferPillTooltip = if FFlagAXDurables2Option then v1 else nil
	}
end