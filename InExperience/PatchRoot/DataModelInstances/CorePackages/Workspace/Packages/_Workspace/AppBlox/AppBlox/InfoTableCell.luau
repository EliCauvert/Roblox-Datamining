local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

local var1 = function() end

local t = { affordance = enums.StateLayerAffordance.None }

return reactModule.memo(function(p1)
	-- upvalues: fFlagSduiExperienceDetailsSupport (ref), reactModule (ref), view (ref), var1 (ref), t (ref), divider (ref), icon (ref), enums (ref)
	local var2 = (p1.numColumns or 1) == 1
	local var3 = nil
	local var4 = nil
	
	if fFlagSduiExperienceDetailsSupport then
		var3 = p1.selectable ~= false
		var4 = reactModule.useMemo(function()
			-- upvalues: var3 (write), p1 (ref)
			return if var3 then { Selectable = true, SelectionOrder = p1.selectionOrder } else nil
		end, { var3, p1.selectionOrder })
	end
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		onActivated = if fFlagSduiExperienceDetailsSupport then p1.onActivated or (if var3 then var1 else nil) else p1.onActivated,
		selection = if fFlagSduiExperienceDetailsSupport then var4 else nil,
		stateLayer = if fFlagSduiExperienceDetailsSupport and var3 and not p1.onActivated then t else nil,
		testId = p1.testId
	}, {
		TopDivider = if not var2 then reactModule.createElement(divider, { LayoutOrder = 1 }) else nil,
		LabelValueContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["row size-full-0 auto-y flex-x-between gap-medium padding-y-large"] = var2,
				["col size-full-0 auto-y padding-y-medium"] = not var2
			}
		}, {
			Label = p1.labelComponent,
			ValueContainer = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["row size-0-full auto-xy fill align-x-right"] = var2,
					["row size-full-0 auto-y"] = not var2
				}
			}, {
				Value = p1.valueComponent,
				ChevronIcon = if p1.onActivated then reactModule.createElement(icon, { name = enums.IconName.ChevronSmallRight }) else nil
			})
		}),
		BottomDivider = if p1.isLastInSingleColumn or not var2 then nil else reactModule.createElement(divider, { LayoutOrder = 3 })
	})
end)