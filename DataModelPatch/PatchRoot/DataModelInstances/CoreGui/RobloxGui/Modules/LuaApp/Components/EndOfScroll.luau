local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local RoactModule = require(Modules.Common.Roact)
local LocalizedTextButtonModule = require(Modules.LuaApp.Components.LocalizedTextButton)

return function(Frame)
	-- upvalues: UseSelectionCursorFunction (copy), CursorKind (copy), WithStyleFunction (copy), RoactModule (copy), LocalizedTextButtonModule (copy)
	local BackToTopCallback = Frame.backToTopCallback
	local LayoutOrder = Frame.LayoutOrder
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local BottomPadding = Frame.bottomPadding or 0
	
	return WithStyleFunction(function(p1)
		-- upvalues: RoactModule (upval), BottomPadding (copy), LayoutOrder (copy), LocalizedTextButtonModule (upval), BackToTopCallback (copy), UseSelectionCursorResult (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 70 + BottomPadding),
			LayoutOrder = LayoutOrder
		}, {
			BackToTopButton = RoactModule.createElement(LocalizedTextButtonModule, {
				Size = UDim2.new(0.5, 0, 0, 30),
				Position = UDim2.new(0.25, 0, 0, 20),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "Feature.GamePage.Action.BackToTop",
				Font = p1.Font.Body.Font,
				TextSize = p1.Font.BaseSize * p1.Font.Body.RelativeSize,
				TextColor3 = p1.Theme.TextEmphasis.Color,
				TextTransparency = p1.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				[RoactModule.Event.Activated] = BackToTopCallback,
				SelectionImageObject = UseSelectionCursorResult
			})
		})
	end)
end