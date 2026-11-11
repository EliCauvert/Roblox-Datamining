local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local List = FoundationModule.List
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize

local function noop() end

return function(p1)
	-- upvalues: noop (copy), ReactModule (copy), Sheet (copy), Text (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy), List (copy), InputSize (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local OnClose = p1.onClose or noop
	local OnPublish = p1.onPublish or noop
	local UseRefResult = ReactModule.useRef(nil)
	local Editing, Editing2 = ReactModule.useState("Editing")
	local IsPublishing = Editing == "Publishing"
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current and UseRefResult.current.close then
			UseRefResult.current.close()
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: IsPublishing (copy), Editing2 (copy), OnPublish (copy)
		if not IsPublishing then
			Editing2("Publishing")
			OnPublish()
			Editing2("Success")
			
			return
		end
	end, { IsPublishing, OnPublish })
	local IsSuccess = Editing == "Success"
	
	return ReactModule.createElement(Sheet.Root, {
		isOpen = p1.isOpen == nil or p1.isOpen,
		sheetRef = UseRefResult,
		onClose = ReactModule.useCallback(function()
			-- upvalues: Editing2 (copy), OnClose (copy)
			Editing2("Editing")
			OnClose()
		end, { OnClose })
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = "Publish game",
				tag = "auto-xy text-heading-small text-truncate-end content-emphasis"
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Content = if IsSuccess then ReactModule.createElement(View, {
				tag = "col align-x-center align-y-center gap-medium size-full-0 auto-y padding-y-xlarge"
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-system-success",
					name = IconName.CircleCheck,
					size = IconSize.XXLarge,
					variant = IconVariant.Filled
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					Text = "Successfully published",
					tag = "auto-xy text-heading-small text-align-x-center content-emphasis"
				}),
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 3,
					Text = "Your game is live and ready to play.",
					tag = "auto-xy text-body-medium text-align-x-center content-default"
				})
			}) else ReactModule.createElement(List.Root, {
				isContained = false,
				hasDivider = { hasDivider = true, isInset = false },
				size = InputSize.Large
			}, {
				Game = ReactModule.createElement(List.Item, {
					LayoutOrder = 1,
					leading = {
						iconName = p1.gameIcon or "rbxthumb://type=GameIcon&id=1818&w=150&h=150"
					},
					title = p1.experienceName or "My Sci-Fi Puzzle",
					onActivated = noop
				}),
				Visibility = ReactModule.createElement(List.Item, {
					LayoutOrder = 2,
					title = "Visibility",
					leading = IconName.TwoPeople,
					description = p1.visibility or "Friends only",
					onActivated = noop
				}),
				Tags = ReactModule.createElement(List.Item, {
					LayoutOrder = 3,
					title = "Tags",
					leading = IconName.Tag,
					description = p1.tags or "Obby, Strategy, Sci-fi, Puzzle",
					onActivated = noop
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Close = if IsSuccess then ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = "Close",
				size = InputSize.Large,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				onActivated = UseResult
			}) else nil,
			Join = if IsSuccess then ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = "Join",
				size = InputSize.Large,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				onActivated = UseResult
			}) else nil,
			Publish = if IsSuccess then nil else ReactModule.createElement(Button, {
				text = "Publish",
				size = InputSize.Large,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isLoading = IsPublishing,
				onActivated = UseResult1
			})
		})
	})
end