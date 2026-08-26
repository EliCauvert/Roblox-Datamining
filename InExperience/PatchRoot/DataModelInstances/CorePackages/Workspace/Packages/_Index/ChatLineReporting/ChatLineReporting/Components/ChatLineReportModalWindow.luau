local parent = script:FindFirstAncestor("ChatLineReporting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = foundationModule.IconButton
local modalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), modalWindow (ref), view (ref), headerBar (ref), iconButton (ref), buttonStack (ref)
	local var1 = not not p1.buttonStackProps
	
	return reactModule.createElement(modalWindow, {
		isFullHeight = false,
		screenSize = p1.screenSize,
		position = p1.position,
		anchorPoint = p1.anchorPoint
	}, {
		Content = reactModule.createElement(view, {
			tag = {
				["size-full-0 auto-y col"] = true,
				["padding-bottom-small"] = not var1,
				["padding-bottom-xxlarge"] = var1
			}
		}, {
			TitleContainer = reactModule.createElement(headerBar, {
				backgroundTransparency = 1,
				margin = 10,
				title = p1.title,
				renderLeft = function()
					-- upvalues: reactModule (copy), iconButton (copy), p1 (ref)
					return reactModule.createElement(iconButton, {
						icon = "icons/navigation/close",
						onActivated = p1.onCloseClicked
					})
				end,
				renderRight = function()
					-- upvalues: reactModule (copy), iconButton (copy), p1 (ref)
					return reactModule.createElement(iconButton, {
						icon = "icons/actions/info",
						onActivated = p1.onInfoClicked
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
			}, p1.children),
			Buttons = var1 and reactModule.createElement(view, {
				tag = "size-full-0 padding-x-xxlarge auto-y",
				LayoutOrder = 3
			}, reactModule.createElement(buttonStack, p1.buttonStackProps))
		})
	})
end