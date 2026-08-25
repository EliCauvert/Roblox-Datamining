local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local modalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local buttonStack = UIBloxModule.App.Button.ButtonStack
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function _(p0)
	return p0.X <= 540
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), modalWindow (ref), view (ref), buttonStack (ref)
	local var3 = useTokens()
	local screenSize = p1.screenSize
	local medium = var3.Margin.Medium
	local large = var3.Margin.Large
	local var4 = p1.bottomPadding or UDim.new(0, medium)
	
	if screenSize.X > 540 then
		var4 = UDim.new(0, medium)
	end
	return reactModule.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		Selectable = false,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		[reactModule.Event.Activated] = function() end,
		ZIndex = 3
	}, {
		PartialPageModal = reactModule.createElement(modalWindow, {
			isFullHeight = false,
			screenSize = screenSize,
			position = p1.position,
			anchorPoint = p1.anchorPoint
		}, {
			ContentContainer = reactModule.createElement(view, {
				tag = "auto-y size-full-0 align-x-left col padding-top-medium padding-x-xxlarge padding-top-xxlarge",
				Position = UDim2.new(0, 0, 0, large),
				backgroundStyle = var3.Color.Surface.Surface_100,
				padding = { bottom = var4 }
			}, {
				Content = reactModule.createElement(view, { tag = "auto-y size-full-0" }, p1.children),
				Buttons = p1.buttonStackProps and reactModule.createElement(buttonStack, p1.buttonStackProps)
			})
		})
	})
end