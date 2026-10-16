local Parent = script:FindFirstAncestor("ChatLineReporting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = FoundationModule.IconButton
local ModalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local View = FoundationModule.View

return function(p1) --[[ Line: 38 | Named "ChatLineReportModalWindow" ]]
	-- upvalues: ReactModule (copy), ModalWindow (copy), View (copy), HeaderBar (copy), IconButton (copy), ButtonStack (copy)
	local Inverted = not not p1.buttonStackProps
	
	return ReactModule.createElement(ModalWindow, {
		isFullHeight = false,
		screenSize = p1.screenSize,
		position = p1.position,
		anchorPoint = p1.anchorPoint
	}, {
		Content = ReactModule.createElement(View, {
			tag = {
				["size-full-0 auto-y col"] = true,
				["padding-bottom-small"] = not Inverted,
				["padding-bottom-xxlarge"] = Inverted
			}
		}, {
			TitleContainer = ReactModule.createElement(HeaderBar, {
				backgroundTransparency = 1,
				margin = 10,
				title = p1.title,
				renderLeft = function() --[[ Line: 56 ]]
					-- upvalues: ReactModule (upval), IconButton (upval), p1 (copy)
					return ReactModule.createElement(IconButton, {
						icon = "icons/navigation/close",
						onActivated = p1.onCloseClicked
					})
				end,
				renderRight = function() --[[ Line: 62 ]]
					-- upvalues: ReactModule (upval), IconButton (upval), p1 (copy)
					return ReactModule.createElement(IconButton, {
						icon = "icons/actions/info",
						onActivated = p1.onInfoClicked
					})
				end
			}),
			Underline = ReactModule.createElement(View, {
				tag = "size-full-0 stroke-standard stroke-default",
				LayoutOrder = 1
			}),
			MiddleContent = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-xxlarge",
				LayoutOrder = 2
			}, p1.children),
			Buttons = Inverted and ReactModule.createElement(View, {
				tag = "size-full-0 padding-x-xxlarge auto-y",
				LayoutOrder = 3
			}, ReactModule.createElement(ButtonStack, p1.buttonStackProps))
		})
	})
end