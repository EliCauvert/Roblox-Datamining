local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Checkbox = require(CorePackages.Packages.Foundation).Checkbox
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Large = UIBloxModule.App.Constant.IconSize.Large

return function(Frame)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), Large (copy), FitTextLabelModule (copy), FitChildrenModule (copy), Checkbox (copy)
	return WithStyleFunction(function(p1)
		-- upvalues: Frame (copy), RoactModule (upval), ImageSetLabel (upval), Large (upval), FitTextLabelModule (upval), FitChildrenModule (upval), Checkbox (upval)
		local BodyFont = p1.Font.Body.Font
		local ScaledBaseSize = p1.Font.BaseSize * p1.Font.Body.RelativeSize
		local Transparency = p1.Theme.TextDefault.Transparency
		local TextColor = Frame.TextColor or p1.Theme.TextDefault.Color
		local List = {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, Frame.MainTextPadding or 0)
			})
		}
		
		if Frame.MainText then
			for i = 1, #Frame.MainText do
				local MainTextEntry = Frame.MainText[i]
				
				if typeof(MainTextEntry) == "table" and Frame.showConsentCheckbox then
					table.insert(List, RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						Image = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							Image = MainTextEntry.image,
							Size = UDim2.fromOffset(Large, Large),
							ScaleType = Enum.ScaleType.Slice
						}),
						Layout = RoactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Top,
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 12)
						}),
						Label = RoactModule.createElement(FitTextLabelModule, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							TextWrapped = true,
							RichText = true,
							Text = MainTextEntry.content,
							TextColor3 = TextColor,
							TextSize = ScaledBaseSize,
							TextTransparency = Transparency,
							Font = BodyFont,
							LayoutOrder = #List,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, -Large, 0, 0),
							fitAxis = FitChildrenModule.FitAxis.Height
						})
					}))
				else
					table.insert(List, RoactModule.createElement(FitTextLabelModule, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						TextWrapped = true,
						Text = MainTextEntry,
						TextColor3 = TextColor,
						TextSize = ScaledBaseSize,
						TextTransparency = Transparency,
						Font = BodyFont,
						LayoutOrder = #List,
						RichText = Frame.showConsentCheckbox,
						TextXAlignment = if Frame.showConsentCheckbox then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height
					}))
				end
			end
			if Frame.LocalizedOptOutText then
				table.insert(List, RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = #List,
					Size = UDim2.new(0, 0, 0, 25),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(if Frame.centerCheckbox then 0.5 else 0, 0.5)
					}, {
						Checkbox = RoactModule.createElement(Checkbox, {
							label = Frame.LocalizedOptOutText,
							onActivated = Frame.onActivated,
							isChecked = Frame.checkboxSelected
						})
					})
				}))
			end
			if Frame.showConsentCheckbox then
				table.insert(List, RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = #List,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 25)
				}, {
					RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(0, 12),
						Size = UDim2.new(1, 0, 0, 50),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Checkbox = not Frame.hideConsent and RoactModule.createElement(Checkbox, {
							label = "",
							onActivated = Frame.consentActivated,
							isChecked = Frame.consentSelected
						}),
						CheckboxContent = if Frame.hideConsent then RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							LayoutOrder = 10,
							TextWrapped = true,
							RichText = true,
							Text = Frame.consentText,
							AutomaticSize = Enum.AutomaticSize.XY,
							TextColor3 = TextColor,
							TextSize = ScaledBaseSize,
							TextTransparency = Transparency,
							Font = BodyFont,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, -10, 0, 0)
						}) else RoactModule.createElement("TextButton", {
							Text = Frame.consentText,
							AutomaticSize = Enum.AutomaticSize.XY,
							TextColor3 = TextColor,
							TextSize = ScaledBaseSize,
							TextTransparency = Transparency,
							Font = BodyFont,
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							LayoutOrder = 10,
							TextWrapped = true,
							RichText = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							[RoactModule.Event.Activated] = Frame.consentActivated,
							Size = UDim2.new(1, -10, 0, 0)
						}),
						Layout = RoactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 10)
						}),
						Padding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 10) })
					})
				}))
			end
		end
		return RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			LayoutOrder = Frame.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 0),
			fitAxis = FitChildrenModule.FitAxis.Height
		}, List)
	end)
end