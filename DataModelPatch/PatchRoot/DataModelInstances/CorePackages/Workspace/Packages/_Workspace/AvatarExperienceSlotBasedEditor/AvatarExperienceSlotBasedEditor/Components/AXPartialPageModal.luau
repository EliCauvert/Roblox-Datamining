local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ModalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1): boolean
	return p1.X <= 540
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ModalWindow (copy), View (copy), ButtonStack (copy)
	local UseTokensResult = UseTokensFunction()
	local ScreenSize = p1.screenSize
	local Medium = UseTokensResult.Margin.Medium
	
	return ReactModule.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		Selectable = false,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		[ReactModule.Event.Activated] = function() end,
		ZIndex = 3
	}, {
		PartialPageModal = ReactModule.createElement(ModalWindow, {
			isFullHeight = false,
			screenSize = ScreenSize,
			position = p1.position,
			anchorPoint = p1.anchorPoint
		}, {
			ContentContainer = ReactModule.createElement(View, {
				tag = "auto-y size-full-0 align-x-left col padding-top-medium padding-x-xxlarge padding-top-xxlarge",
				Position = UDim2.new(0, 0, 0, UseTokensResult.Margin.Large),
				backgroundStyle = UseTokensResult.Color.Surface.Surface_100,
				padding = {
					bottom = if p1.bottomPadding then if ScreenSize.X <= 540 then p1.bottomPadding else UDim.new(0, Medium) elseif ScreenSize.X <= 540 then UDim.new(0, Medium) else UDim.new(0, Medium)
				}
			}, {
				Content = ReactModule.createElement(View, { tag = "auto-y size-full-0" }, p1.children),
				Buttons = p1.buttonStackProps and ReactModule.createElement(ButtonStack, p1.buttonStackProps)
			})
		})
	})
end