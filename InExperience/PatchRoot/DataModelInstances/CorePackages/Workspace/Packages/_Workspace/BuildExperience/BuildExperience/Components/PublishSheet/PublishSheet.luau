local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local icon = foundationModule.Icon
local list = foundationModule.List
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize

local function noop() --[[ line: 35 ]] end

return function(p0) --[[ line: 37 | named "PublishSheet" ]]
	-- upvalues: noop (ref), reactModule (ref), sheet (ref), text (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref), list (ref), inputSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local onClose = p0.onClose or noop
	local onPublish = p0.onPublish or noop
	local var5 = reactModule.useRef(nil)
	local editing, editing_1 = reactModule.useState("Editing")
	local isPublishing = editing == "Publishing"
	local var9 = reactModule.useCallback(function() --[[ line: 44 ]]
		-- upvalues: var5 (ref)
		if var5.current and var5.current.close then
			var5.current.close()
		end
	end, {})
	local isSuccess = editing == "Success"
	
	return reactModule.createElement(sheet.Root, {
		isOpen = p0.isOpen == nil or p0.isOpen,
		sheetRef = var5,
		onClose = reactModule.useCallback(function() --[[ line: 50 ]]
			-- upvalues: editing_1 (ref), onClose (ref)
			editing_1("Editing")
			onClose()
		end, { onClose })
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = "Publish game",
				tag = "auto-xy text-heading-small text-truncate-end content-emphasis"
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			Content = if isSuccess then reactModule.createElement(view, {
				tag = "col align-x-center align-y-center gap-medium size-full-0 auto-y padding-y-xlarge"
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-system-success",
					name = iconName.CircleCheck,
					size = iconSize.XXLarge,
					variant = iconVariant.Filled
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					Text = "Successfully published",
					tag = "auto-xy text-heading-small text-align-x-center content-emphasis"
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 3,
					Text = "Your game is live and ready to play.",
					tag = "auto-xy text-body-medium text-align-x-center content-default"
				})
			}) else reactModule.createElement(list.Root, {
				isContained = false,
				hasDivider = { hasDivider = true, isInset = false },
				size = inputSize.Large
			}, {
				Game = reactModule.createElement(list.Item, {
					LayoutOrder = 1,
					leading = {
						iconName = p0.gameIcon or "rbxthumb://type=GameIcon&id=1818&w=150&h=150"
					},
					title = p0.experienceName or "My Sci-Fi Puzzle",
					onActivated = noop
				}),
				Visibility = reactModule.createElement(list.Item, {
					LayoutOrder = 2,
					title = "Visibility",
					leading = iconName.TwoPeople,
					description = p0.visibility or "Friends only",
					onActivated = noop
				}),
				Tags = reactModule.createElement(list.Item, {
					LayoutOrder = 3,
					title = "Tags",
					leading = iconName.Tag,
					description = p0.tags or "Obby, Strategy, Sci-fi, Puzzle",
					onActivated = noop
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Close = if isSuccess then reactModule.createElement(button, {
				LayoutOrder = 1,
				text = "Close",
				size = inputSize.Large,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				onActivated = var9
			}) else nil,
			Join = if isSuccess then reactModule.createElement(button, {
				LayoutOrder = 2,
				text = "Join",
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				onActivated = var9
			}) else nil,
			Publish = if not isSuccess then reactModule.createElement(button, {
				text = "Publish",
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = isPublishing,
				onActivated = reactModule.useCallback(function() --[[ line: 55 ]]
					-- upvalues: isPublishing (ref), editing_1 (ref), onPublish (ref)
					if isPublishing then
						return
					end
					editing_1("Publishing")
					onPublish()
					editing_1("Success")
				end, { isPublishing, onPublish })
			}) else nil
		})
	})
end