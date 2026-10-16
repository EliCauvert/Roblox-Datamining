local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ButtonModule = require(Foundation.Components.Button)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local DialogModule = require(Foundation.Components.Dialog)
local _ = require(Foundation.Components.Dialog.Actions)
local DialogSizeModule = require(Foundation.Enums.DialogSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ListModule = require(Foundation.Components.List)
local _ = require(Foundation.Enums.OnCloseCallbackReason)
local _ = require(Foundation.Enums.Orientation)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local Medium = DialogSizeModule.Medium
local list = {
	{
		text = "Cancel",
		variant = ButtonVariantModule.Standard,
		onActivated = function() --[[ Line: 80 ]] end
	},
	{
		text = "Confirm",
		variant = ButtonVariantModule.Emphasis,
		onActivated = function() --[[ Line: 85 ]] end
	}
}

local function makeScrollableListItems(p1) --[[ Line: 89 ]]
	-- upvalues: ReactModule (copy), ListModule (copy)
	local Elements = {}
	
	for i = 1, p1 do
		Elements[`Item{i}`] = ReactModule.createElement(ListModule.Item, {
			title = `Item {i}`,
			onActivated = function() --[[ Line: 94 ]] end,
			LayoutOrder = i
		})
	end
	return Elements
end

local function dialogStoryList(p2, LayoutOrder) --[[ Line: 101 ]]
	-- upvalues: ReactModule (copy), ListModule (copy), InputSizeModule (copy), makeScrollableListItems (copy)
	return ReactModule.createElement(ListModule.Root, {
		LayoutOrder = LayoutOrder,
		isContained = { isContained = false, hasMargin = false },
		hasDivider = { hasDivider = true, isInset = false },
		size = InputSizeModule.Small
	}, (makeScrollableListItems(p2)))
end

local function makeDialogChildren(p2) --[[ Line: 116 ]]
	-- upvalues: ReactModule (copy), DialogModule (copy), list (copy)
	local P3 = p2 or {}
	local HeroMedia = P3.heroMedia
	
	return {
		DialogMedia = if P3.hasHeroMedia then ReactModule.createElement(DialogModule.HeroMedia, {
			media = HeroMedia and HeroMedia.media or "rbxassetid://103403748802347",
			aspectRatio = if HeroMedia then HeroMedia.aspectRatio else 1.7777777777777777,
			mediaStyle = if HeroMedia then HeroMedia.mediaStyle else nil,
			backgroundStyle = if HeroMedia then HeroMedia.backgroundStyle else nil,
			height = if HeroMedia then HeroMedia.height else nil,
			scaleType = if HeroMedia then HeroMedia.scaleType else nil
		}) else nil,
		DialogTitle = if P3.hasTitle == false then nil else ReactModule.createElement(DialogModule.Title, { text = P3.title or "Dialog title" }),
		DialogContent = ReactModule.createElement(DialogModule.Content, { LayoutOrder = 2, Selectable = P3.contentSelectable }, if P3.contentChildren then P3.contentChildren else {
			DialogText = ReactModule.createElement(DialogModule.Text, {
				LayoutOrder = 1,
				Text = P3.content or "Dialog.Text content goes here."
			})
		}),
		DialogActions = if P3.hasActions then ReactModule.createElement(DialogModule.Actions, {
			LayoutOrder = 3,
			orientation = P3.actionsOrientation,
			label = P3.actionsLabel,
			actions = P3.actions or list
		}) else nil
	}
end

local function DialogExample(p2) --[[ Line: 229 ]]
	-- upvalues: ReactModule (copy), DialogModule (copy), Medium (copy)
	return ReactModule.createElement(DialogModule.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = p2.size or Medium,
		onClose = p2.onClose
	}, {
		DialogMedia = p2.children.DialogMedia,
		DialogTitle = p2.children.DialogTitle,
		DialogContent = p2.children.DialogContent,
		DialogActions = p2.children.DialogActions
	})
end

return {
	SHORT_CONTENT = "Dialog.Text content goes here.",
	HERO_MEDIA = "rbxassetid://103403748802347",
	DEFAULT_SIZE = Medium,
	DEFAULT_ACTIONS = list,
	SIZE_ORDER = {
		DialogSizeModule.Small,
		DialogSizeModule.Medium,
		DialogSizeModule.Large
	},
	Section = function(p2) --[[ Line: 190 ]]
		-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
		return ReactModule.createElement(ViewModule, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = p2.layoutOrder
		}, {
			Title = if p2.note then ReactModule.createElement(ViewModule, { tag = "col gap-xsmall auto-xy", LayoutOrder = 1 }, {
				Name = ReactModule.createElement(TextModule, {
					tag = "auto-xy text-label-medium content-default",
					LayoutOrder = 1,
					Text = p2.name
				}),
				Note = ReactModule.createElement(TextModule, {
					tag = "auto-xy text-body-small content-muted",
					LayoutOrder = 2,
					Text = p2.note
				})
			}) else ReactModule.createElement(TextModule, {
				tag = "auto-xy text-label-medium content-default",
				LayoutOrder = 1,
				Text = p2.name
			}),
			Content = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = p2.contentTag or "row gap-large align-y-start auto-xy wrap"
			}, p2.children)
		})
	end,
	makeDialogChildren = makeDialogChildren,
	minimalDialogChildren = function(Title, Content) --[[ Line: 162 ]]
		-- upvalues: makeDialogChildren (copy)
		return (makeDialogChildren({ title = Title, content = Content }))
	end,
	listDialogChildren = function(p2, ContentSelectable) --[[ Line: 169 ]]
		-- upvalues: makeDialogChildren (copy), dialogStoryList (copy)
		return (makeDialogChildren({
			contentSelectable = ContentSelectable,
			contentChildren = { List = dialogStoryList(p2) }
		}))
	end,
	heroMediaDialogChildren = function(p2) --[[ Line: 178 ]]
		-- upvalues: DashModule (copy), makeDialogChildren (copy)
		local P8 = p2 or {}
		
		if P8.aspectRatio == nil then
			P8 = DashModule.join(P8, { aspectRatio = 1.7777777777777777 })
		end
		return (makeDialogChildren({ hasHeroMedia = true, heroMedia = P8 }))
	end,
	dialogStoryList = dialogStoryList,
	DialogExample = DialogExample,
	LabeledDialogTrigger = function(p2) --[[ Line: 247 ]]
		-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy), ButtonModule (copy), ButtonVariantModule (copy), DialogExample (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		
		return ReactModule.createElement(ViewModule, {
			tag = "col gap-small auto-xy",
			LayoutOrder = p2.layoutOrder
		}, {
			Label = if p2.label then ReactModule.createElement(TextModule, {
				tag = "auto-xy text-caption-small text-align-x-left content-default",
				LayoutOrder = 1,
				Text = p2.label
			}) else nil,
			OpenButton = ReactModule.createElement(ViewModule, { tag = "auto-xy", LayoutOrder = 2 }, {
				Button = ReactModule.createElement(ButtonModule, {
					text = if UseStateResult then "Close" else p2.buttonText or "Open",
					onActivated = function() --[[ Line: 273 ]]
						-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
						UseStateResult2(not UseStateResult)
					end,
					variant = if UseStateResult then ButtonVariantModule.Standard else ButtonVariantModule.Emphasis
				})
			}),
			DialogRoot = if UseStateResult then ReactModule.createElement(DialogExample, {
				size = p2.size,
				onClose = function() --[[ Line: 282 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end,
				children = p2.children
			}) else nil
		})
	end,
	RootStory = function(p2) --[[ Line: 291 ]]
		-- upvalues: ReactModule (copy), ViewModule (copy), ButtonModule (copy), ButtonVariantModule (copy), DialogExample (copy), makeDialogChildren (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		
		return ReactModule.createElement(ViewModule, { tag = "auto-xy" }, {
			ToggleButton = ReactModule.createElement(ButtonModule, {
				text = if UseStateResult then "Close Dialog" else "Open Dialog",
				onActivated = function() --[[ Line: 299 ]]
					-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
					UseStateResult2(not UseStateResult)
				end,
				variant = ButtonVariantModule.Emphasis
			}),
			DialogRoot = if UseStateResult then ReactModule.createElement(DialogExample, {
				size = p2.controls.size,
				onClose = function() --[[ Line: 307 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end,
				children = p2.children or makeDialogChildren({ title = nil, content = nil })
			}) else nil
		})
	end
}