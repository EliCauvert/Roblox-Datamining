local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

local var2 = function() --[[ line: 14 ]] end

local t = { affordance = enums.StateLayerAffordance.None }

return reactModule.memo(function(p0) --[[ line: 36 | named "InfoTableCell" ]]
	-- upvalues: fFlagSduiExperienceDetailsSupport (ref), reactModule (ref), view (ref), var2 (ref), t (ref), divider (ref), icon (ref), enums (ref)
	local var4 = (p0.numColumns or 1) == 1
	local var5 = nil
	local var6 = nil
	
	if fFlagSduiExperienceDetailsSupport then
		var5 = p0.selectable ~= false
		var6 = reactModule.useMemo(function() --[[ line: 44 ]]
			-- upvalues: var5 (write), p0 (ref)
			return if var5 then { Selectable = true, SelectionOrder = p0.selectionOrder } else nil
		end, { var5, p0.selectionOrder })
	end
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		onActivated = if fFlagSduiExperienceDetailsSupport then p0.onActivated or (if var5 then var2 else nil) else p0.onActivated,
		selection = if fFlagSduiExperienceDetailsSupport then var6 else nil,
		stateLayer = if fFlagSduiExperienceDetailsSupport and var5 and not p0.onActivated then t else nil,
		testId = p0.testId
	}, {
		TopDivider = if not var4 then reactModule.createElement(divider, { LayoutOrder = 1 }) else nil,
		LabelValueContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["row size-full-0 auto-y flex-x-between gap-medium padding-y-large"] = var4,
				["col size-full-0 auto-y padding-y-medium"] = not var4
			}
		}, {
			Label = p0.labelComponent,
			ValueContainer = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["row size-0-full auto-xy fill align-x-right"] = var4,
					["row size-full-0 auto-y"] = not var4
				}
			}, {
				Value = p0.valueComponent,
				ChevronIcon = if p0.onActivated then reactModule.createElement(icon, { name = enums.IconName.ChevronSmallRight }) else nil
			})
		}),
		BottomDivider = if p0.isLastInSingleColumn or not var4 then nil else reactModule.createElement(divider, { LayoutOrder = 3 })
	})
end)