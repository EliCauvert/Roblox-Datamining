local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Sheet = if require(BuildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then FoundationModule.Sheet else require(BuildExperience.FoundationFork.Sheet)
local Button = FoundationModule.Button
local Divider = FoundationModule.Divider
local Icon = FoundationModule.Icon
local Loading = FoundationModule.Loading
local RadioGroup = FoundationModule.RadioGroup
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Computed = SignalsModule.createComputed(function(): string
	return "NotReady"
end)
local Computed1 = SignalsModule.createComputed(function()
	return nil
end)

local function getRows(UseSignalStateResult)
	-- upvalues: CreatorAgentChatModule (copy)
	local List = {
		{
			value = "default",
			title = "Default (latest)",
			description = nil,
			override = "",
			isPinned = false
		}
	}
	
	if UseSignalStateResult ~= nil then
		local t = {}
		local t1 = {}
		local t2 = {}
		
		for _, item in UseSignalStateResult.items do
			local IsPinnedMatch = item.pinned == CreatorAgentChatModule.PreviewSpecs.PreviewSpecPinned.Hash
			local HashName: string = if IsPinnedMatch then `pr-{item.prNumber}-hash` else `pr-{item.prNumber}`
			
			if not t2[HashName] then
				t2[HashName] = true
				table.insert(if item.pinned == nil then t1 else t, {
					value = HashName,
					title = if item.title == "" then `PR #{item.prNumber}` else item.title,
					description = `#{item.prNumber} · {item.override}`,
					override = item.override,
					isPinned = item.pinned ~= nil
				})
			end
		end
		for _, value in t do
			table.insert(List, value)
		end
		for i, value1 in t1 do
			if i > 25 then break end
			table.insert(List, value1)
		end
	end
	return List
end

local function getSelectedValue(UseMemoResult, Override, p1)
	-- upvalues: CreatorAgentChatModule (copy)
	if CreatorAgentChatModule.experimentOverride.normalize(Override) == "" then
		return "default"
	end
	local v1 = ""
	
	for _, value in UseMemoResult do
		if value.value ~= "default" and value.override == Override and (v1 == "" or value.value == p1) then
			v1 = value.value
		end
	end
	return v1
end

return function(p2)
	-- upvalues: FoundationModule (copy), ReactModule (copy), CreatorAgentChatModule (copy), SignalsReactModule (copy), Computed (copy), Computed1 (copy), getRows (copy), View (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy), RadioGroup (copy), InputSize (copy), Divider (copy), getSelectedValue (copy), Loading (copy), Sheet (copy), TextInput (copy), Button (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p2.specVersion or "")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), CreatorAgentChatModule (upval)
		UseStateResult2_1(CreatorAgentChatModule.PreviewSpecs.getPreviewSpecsStore(false).refreshPreviewSpecs())
	end, {})
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseStateResult1 == nil then Computed else UseStateResult1.status)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseStateResult1 == nil then Computed1 else UseStateResult1.data)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getRows (upval), UseSignalStateResult1 (copy)
		return (getRows(UseSignalStateResult1))
	end, { UseSignalStateResult1 })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: UseMemoResult (copy), UseStateResult2 (copy), UseStateResult2_2 (copy)
		for _, value in UseMemoResult do
			if value.value == p3 then
				UseStateResult2(value.override)
				UseStateResult2_2(p3)
				break
			end
		end
	end, { UseMemoResult })
	local Element = nil
	
	if UseSignalStateResult == "Ready" then
		local Ceiled = math.ceil(UseTokensResult.Typography.TitleMedium.FontSize * UseTokensResult.Typography.TitleMedium.LineHeight)
		local Elements = {}
		
		for LayoutOrder, value in UseMemoResult do
			Elements[value.value] = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y",
				LayoutOrder = LayoutOrder
			}, {
				Row = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small",
					onActivated = function()
						-- upvalues: UseResult (copy), value (copy)
						UseResult(value.value)
					end
				}, {
					Text = ReactModule.createElement(View, { LayoutOrder = 1, tag = "col fill gap-xsmall auto-y" }, {
						TitleRow = ReactModule.createElement(View, {
							LayoutOrder = 1,
							tag = "row align-y-top gap-xsmall size-full-0 auto-y"
						}, {
							Title = ReactModule.createElement(Text, {
								LayoutOrder = 2,
								tag = "auto-xy text-title-medium text-wrap text-align-x-left content-emphasis",
								Text = value.title
							}),
							Pin = if value.isPinned then ReactModule.createElement(View, {
								LayoutOrder = 1,
								tag = "row align-y-center auto-x",
								Size = UDim2.fromOffset(0, Ceiled)
							}, {
								Icon = ReactModule.createElement(Icon, { name = IconName.Pin, size = IconSize.XSmall })
							}) else nil
						}),
						Description = if value.description then ReactModule.createElement(Text, {
							LayoutOrder = 2,
							tag = "auto-xy text-body-medium text-wrap text-align-x-left",
							Text = value.description
						}) else nil
					}),
					Radio = ReactModule.createElement(RadioGroup.Item, {
						LayoutOrder = 2,
						label = "",
						size = InputSize.Medium,
						value = value.value
					})
				}),
				Divider = if LayoutOrder < #UseMemoResult then ReactModule.createElement(Divider, { LayoutOrder = 2 }) else nil
			})
		end
		Element = ReactModule.createElement(RadioGroup.Root, {
			Selectable = false,
			tag = "size-full-0 auto-y",
			onValueChanged = UseResult,
			value = getSelectedValue(UseMemoResult, UseStateResult, UseStateResult3)
		}, {
			Rows = ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, Elements)
		})
	else
		Element = if UseSignalStateResult == "Failed" then ReactModule.createElement(Text, {
			Text = "Preview list unavailable",
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted"
		}) else ReactModule.createElement(View, { tag = "row align-y-center gap-small size-full-0 auto-y" }, {
			Spinner = ReactModule.createElement(Loading, { LayoutOrder = 1, size = IconSize.Small }),
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = "Loading previews",
				tag = "auto-xy text-body-medium"
			})
		})
	end
	return ReactModule.createElement(Sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p2.onClose,
		ref = p2.focusRootRef,
		testId = p2.testId
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = p2.hasCloseAffordance ~= false }, {
			Title = ReactModule.createElement(Text, {
				Text = "Agent Spec",
				tag = "auto-xy text-heading-small content-emphasis"
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, { List = Element }),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Form = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
				Input = ReactModule.createElement(TextInput, {
					LayoutOrder = 1,
					label = "specVersion",
					placeholder = "Leave empty for latest",
					text = UseStateResult,
					width = UDim.new(1, 0),
					onChanged = UseStateResult2
				}),
				Save = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = "Save",
					size = InputSize.Large,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					width = UDim.new(1, 0),
					onActivated = function()
						-- upvalues: p2 (copy), UseStateResult (copy)
						p2.onSave(UseStateResult)
						p2.onClose()
					end
				})
			})
		})
	})
end