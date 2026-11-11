local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseIsGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local RadioButtonGroupModule = require(Modules.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup)
local CheckboxGroup = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.Filters.CheckboxGroup
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local _UDim = UDim.new(0, 4)

local function _(p1: number): number
	-- upvalues: _UDim (copy)
	return p1 + 19 + _UDim.Offset
end

return function(Frame)
	-- upvalues: UseStyleFunction (copy), UseIsGamepadFunction (copy), ReactModule (copy), _UDim (copy), CheckboxGroup (copy), RadioButtonGroupModule (copy), Focusable (copy), FilterUtilsModule (copy), ConstantsModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseIsGamepadResult = UseIsGamepadFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UseBindingResult:map(function(p1: number): UDim2
			-- upvalues: _UDim (upval)
			return UDim2.new(1, 0, 0, p1 + 19 + _UDim.Offset)
		end),
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.frameRef,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = _UDim
		}),
		Title = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = UseStyleResultFont.Header2.Font,
			TextSize = UseStyleResultFont.Header2.RelativeSize * UseStyleResultFont.BaseSize,
			Text = Frame.title,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency
		}),
		RadioButtonGroupContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UseBindingResult:map(FilterUtilsModule.mapHeightToSize)
		}, {
			RadioButtons = ReactModule.createElement(if Frame.selectionMode == "multiple" then CheckboxGroup else RadioButtonGroupModule, {
				items = Frame.items,
				itemHeight = ConstantsModule.SortAndFiltersRowHeight,
				selectedValue = Frame.selectedValue,
				onActivated = function(p1)
					-- upvalues: Frame (copy)
					if Frame.setSelectedValue then
						Frame.setSelectedValue(p1)
					end
				end,
				useDefaultControlState = UseIsGamepadResult,
				onHeightChanged = function(NewOffset: number)
					-- upvalues: UseBindingResult2 (copy), Frame (copy), _UDim (upval)
					UseBindingResult2(NewOffset)
					
					if Frame.onHeightChanged then
						Frame.onHeightChanged(NewOffset + 19 + _UDim.Offset)
					end
				end
			})
		})
	})
end