local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local buttonModule = require(foundation.Components.Button)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local dialogModule = require(foundation.Components.Dialog)
local _ = require(foundation.Components.Dialog.Actions)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local listModule = require(foundation.Components.List)
local _ = require(foundation.Enums.OnCloseCallbackReason)
local _ = require(foundation.Enums.Orientation)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local list = {
	dialogSizeModule.Small,
	dialogSizeModule.Medium,
	dialogSizeModule.Large
}
local medium = dialogSizeModule.Medium
local list_1 = {
	{
		text = "Cancel",
		variant = buttonVariantModule.Standard,
		onActivated = function() end
	},
	{
		text = "Confirm",
		variant = buttonVariantModule.Emphasis,
		onActivated = function() end
	}
}

local function makeScrollableListItems(p1)
	-- upvalues: reactModule (ref), listModule (ref)
	local t = {}
	
	for i = 1, p1 do
		t[`Item{i}`] = reactModule.createElement(listModule.Item, {
			title = `Item {i}`,
			onActivated = function() end,
			LayoutOrder = i
		})
	end
	return t
end

local function dialogStoryList(p2, p3)
	-- upvalues: reactModule (ref), listModule (ref), inputSizeModule (ref), makeScrollableListItems (ref)
	return reactModule.createElement(listModule.Root, {
		LayoutOrder = p3,
		isContained = { isContained = false, hasMargin = false },
		hasDivider = { hasDivider = true, isInset = false },
		size = inputSizeModule.Small
	}, makeScrollableListItems(p2))
end

local function makeDialogChildren(p2)
	-- upvalues: reactModule (ref), dialogModule (ref), list_1 (ref)
	p2 = p2 or {}
	local heroMedia = p2.heroMedia
	
	return {
		DialogMedia = if p2.hasHeroMedia then reactModule.createElement(dialogModule.HeroMedia, {
			media = if heroMedia then heroMedia.media else "rbxassetid://103403748802347",
			aspectRatio = if heroMedia then heroMedia.aspectRatio else 1.777777777778,
			mediaStyle = if heroMedia then heroMedia.mediaStyle else nil,
			backgroundStyle = if heroMedia then heroMedia.backgroundStyle else nil,
			height = if heroMedia then heroMedia.height else nil
		}) else nil,
		DialogTitle = if p2.hasTitle ~= false then nil else reactModule.createElement(dialogModule.Title, { text = p2.title or "Dialog title" }),
		DialogContent = reactModule.createElement(dialogModule.Content, { LayoutOrder = 2, Selectable = p2.contentSelectable }, if p2.contentChildren then p2.contentChildren else {
			DialogText = reactModule.createElement(dialogModule.Text, {
				LayoutOrder = 1,
				Text = p2.content or "Dialog.Text content goes here."
			})
		}),
		DialogActions = if p2.hasActions then reactModule.createElement(dialogModule.Actions, {
			LayoutOrder = 3,
			orientation = p2.actionsOrientation,
			label = p2.actionsLabel,
			actions = p2.actions or list_1
		}) else nil
	}
end

local function DialogExample(p2)
	-- upvalues: reactModule (ref), dialogModule (ref), medium (ref)
	return reactModule.createElement(dialogModule.Root, {
		size = p2.size or medium,
		hasBackdrop = p2.hasBackdrop ~= nil or p2.hasBackdrop,
		disablePortal = if p2.disablePortal ~= nil then false else p2.disablePortal,
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
	DEFAULT_SIZE = medium,
	DEFAULT_ACTIONS = list_1,
	SIZE_ORDER = list,
	Section = function(p2)
		-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
		return reactModule.createElement(viewModule, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = p2.layoutOrder
		}, {
			Title = if p2.note then reactModule.createElement(viewModule, { tag = "col gap-xsmall auto-xy", LayoutOrder = 1 }, {
				Name = reactModule.createElement(textModule, {
					tag = "auto-xy text-label-medium content-default",
					LayoutOrder = 1,
					Text = p2.name
				}),
				Note = reactModule.createElement(textModule, {
					tag = "auto-xy text-body-small content-muted",
					LayoutOrder = 2,
					Text = p2.note
				})
			}) else reactModule.createElement(textModule, {
				tag = "auto-xy text-label-medium content-default",
				LayoutOrder = 1,
				Text = p2.name
			}),
			Content = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = p2.contentTag or "row gap-large align-y-start auto-xy wrap"
			}, p2.children)
		})
	end,
	makeDialogChildren = makeDialogChildren,
	minimalDialogChildren = function(a, b)
		-- upvalues: makeDialogChildren (ref)
		return makeDialogChildren({ title = a, content = b })
	end,
	listDialogChildren = function(p2, p3)
		-- upvalues: makeDialogChildren (ref), dialogStoryList (ref)
		return makeDialogChildren({
			contentSelectable = p3,
			contentChildren = { List = dialogStoryList(p2) }
		})
	end,
	heroMediaDialogChildren = function(p2)
		-- upvalues: dashModule (ref), makeDialogChildren (ref)
		local var1 = p2 or {}
		
		if var1.aspectRatio == nil then
			var1 = dashModule.join(var1, { aspectRatio = 1.777777777778 })
		end
		return makeDialogChildren({ hasHeroMedia = true, heroMedia = var1 })
	end,
	dialogStoryList = dialogStoryList,
	DialogExample = DialogExample,
	LabeledDialogTrigger = function(p2)
		-- upvalues: reactModule (ref), viewModule (ref), textModule (ref), buttonModule (ref), buttonVariantModule (ref), DialogExample (ref)
		local var1, var2 = reactModule.useState(false)
		
		return reactModule.createElement(viewModule, {
			tag = "col gap-small auto-xy",
			LayoutOrder = p2.layoutOrder
		}, {
			Label = if p2.label then reactModule.createElement(textModule, {
				tag = "auto-xy text-caption-small text-align-x-left content-default",
				LayoutOrder = 1,
				Text = p2.label
			}) else nil,
			OpenButton = reactModule.createElement(viewModule, { tag = "auto-xy", LayoutOrder = 2 }, {
				Button = reactModule.createElement(buttonModule, {
					text = if var1 then "Close" else p2.buttonText or "Open",
					onActivated = function()
						-- upvalues: var2 (ref), var1 (ref)
						var2(not var1)
					end,
					variant = if var1 then buttonVariantModule.Standard else buttonVariantModule.Emphasis
				})
			}),
			DialogRoot = if var1 then reactModule.createElement(DialogExample, {
				size = p2.size,
				hasBackdrop = p2.hasBackdrop,
				onClose = function()
					-- upvalues: var2 (ref)
					var2(false)
				end,
				children = p2.children
			}) else nil
		})
	end,
	RootStory = function(p2)
		-- upvalues: reactModule (ref), viewModule (ref), buttonModule (ref), buttonVariantModule (ref), DialogExample (ref), makeDialogChildren (ref)
		local var1, var2 = reactModule.useState(false)
		
		return reactModule.createElement(viewModule, { tag = "auto-xy" }, {
			ToggleButton = reactModule.createElement(buttonModule, {
				text = if var1 then "Close Dialog" else "Open Dialog",
				onActivated = function()
					-- upvalues: var2 (ref), var1 (ref)
					var2(not var1)
				end,
				variant = buttonVariantModule.Emphasis
			}),
			DialogRoot = if var1 then reactModule.createElement(DialogExample, {
				size = p2.controls.size,
				hasBackdrop = p2.controls.hasBackdrop,
				disablePortal = p2.controls.disablePortal,
				onClose = function()
					-- upvalues: var2 (ref)
					var2(false)
				end,
				children = p2.children or makeDialogChildren({ title = nil, content = nil })
			}) else nil
		})
	end
}