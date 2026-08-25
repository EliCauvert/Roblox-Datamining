local parent = script:FindFirstAncestor("ChatLineReporting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = foundationModule.IconButton
local modalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local view = foundationModule.View

return function(p0)
	-- upvalues: reactModule (ref), modalWindow (ref), view (ref), headerBar (ref), iconButton (ref), buttonStack (ref)
	local var3 = not not p0.buttonStackProps
	
	return reactModule.createElement(modalWindow, {
		isFullHeight = false,
		screenSize = p0.screenSize,
		position = p0.position,
		anchorPoint = p0.anchorPoint
	}, {
		Content = reactModule.createElement(view, {
			tag = {
				["size-full-0 auto-y col"] = true,
				["padding-bottom-small"] = not var3,
				["padding-bottom-xxlarge"] = var3
			}
		}, {
			TitleContainer = reactModule.createElement(headerBar, {
				backgroundTransparency = 1,
				margin = 10,
				title = p0.title,
				renderLeft = function()
					-- upvalues: reactModule (copy), iconButton (copy), p0 (ref)
					return reactModule.createElement(iconButton, {
						icon = "icons/navigation/close",
						onActivated = p0.onCloseClicked
					})
				end,
				renderRight = function()
					-- upvalues: reactModule (copy), iconButton (copy), p0 (ref)
					return reactModule.createElement(iconButton, {
						icon = "icons/actions/info",
						onActivated = p0.onInfoClicked
					})
				end
			}),
			Underline = reactModule.createElement(view, {
				tag = "size-full-0 stroke-standard stroke-default",
				LayoutOrder = 1
			}),
			MiddleContent = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-xxlarge",
				LayoutOrder = 2
			}, p0.children),
			Buttons = var3 and reactModule.createElement(view, {
				tag = "size-full-0 padding-x-xxlarge auto-y",
				LayoutOrder = 3
			}, reactModule.createElement(buttonStack, p0.buttonStackProps))
		})
	})
end