local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

local function v8() end

local config = { affordance = Enums.StateLayerAffordance.None }

return ReactModule.memo(function(p1)
	-- upvalues: FFlagSduiExperienceDetailsSupport (copy), ReactModule (copy), View (copy), v8 (copy), config (copy), Divider (copy), Icon (copy), Enums (copy)
	local v1 = (p1.numColumns or 1) == 1
	local IsSelectable: boolean? = nil
	local UseMemoResult = nil
	
	if FFlagSduiExperienceDetailsSupport then
		IsSelectable = p1.selectable ~= false
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: IsSelectable (ref), p1 (copy)
			return if IsSelectable then { Selectable = true, SelectionOrder = p1.selectionOrder } else nil
		end, { IsSelectable, p1.selectionOrder })
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		onActivated = if FFlagSduiExperienceDetailsSupport then p1.onActivated or (if IsSelectable then v8 else nil) else p1.onActivated,
		selection = if FFlagSduiExperienceDetailsSupport then UseMemoResult else nil,
		stateLayer = if FFlagSduiExperienceDetailsSupport and IsSelectable and not p1.onActivated then config else nil,
		testId = p1.testId
	}, {
		TopDivider = if v1 then nil else ReactModule.createElement(Divider, { LayoutOrder = 1 }),
		LabelValueContainer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["row size-full-0 auto-y flex-x-between gap-medium padding-y-large"] = v1,
				["col size-full-0 auto-y padding-y-medium"] = not v1
			}
		}, {
			Label = p1.labelComponent,
			ValueContainer = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = {
					["row size-0-full auto-xy fill align-x-right"] = v1,
					["row size-full-0 auto-y"] = not v1
				}
			}, {
				Value = p1.valueComponent,
				ChevronIcon = if p1.onActivated then ReactModule.createElement(Icon, { name = Enums.IconName.ChevronSmallRight }) else nil
			})
		}),
		BottomDivider = if p1.isLastInSingleColumn or not v1 then nil else ReactModule.createElement(Divider, { LayoutOrder = 3 })
	})
end)