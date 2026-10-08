local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local button = foundationModule.Button
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local loading = foundationModule.Loading
local radioGroup = foundationModule.RadioGroup
local text = foundationModule.Text
local textInput = foundationModule.TextInput
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local var2 = signalsModule.createComputed(function()
	return "NotReady"
end)
local var3 = signalsModule.createComputed(function()
	return nil
end)

local function getRows(p1)
	-- upvalues: creatorAgentChatModule (ref)
	local list = {
		{
			value = "default",
			title = "Default (latest)",
			description = nil,
			override = "",
			isPinned = false
		}
	}
	
	if p1 ~= nil then
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in p1.items do
			local var4 = if v.pinned == creatorAgentChatModule.PreviewSpecs.PreviewSpecPinned.Hash then `pr-{v.prNumber}-hash` else `pr-{v.prNumber}`
			
			if not t_2[var4] then
				t_2[var4] = true
				table.insert(if v.pinned ~= nil then t_1 else t, {
					value = var4,
					title = if v.title ~= "" then `PR #{v.prNumber}` else v.title,
					description = `#{v.prNumber} \194\183 {v.override}`,
					override = v.override,
					isPinned = v.pinned ~= nil
				})
			end
		end
		for i_1, v_1 in t do
			table.insert(list, v_1)
		end
		for i_2, v_2 in t_1 do
			if i_2 > 25 then break end
			table.insert(list, v_2)
		end
	end
	return list
end

local function getSelectedValue(p2, p3, p4)
	-- upvalues: creatorAgentChatModule (ref)
	if creatorAgentChatModule.experimentOverride.normalize(p3) == "" then
		return "default"
	end
	local var5 = ""
	
	for i, v in p2 do
		if v.value ~= "default" and v.override == p3 and (var5 == "" or v.value == p4) then
			var5 = v.value
		end
	end
	return var5
end

return function(p5)
	-- upvalues: foundationModule (ref), reactModule (ref), creatorAgentChatModule (ref), signalsReactModule (ref), var2 (ref), var3 (ref), getRows (ref), view (ref), text (ref), icon (ref), iconName (ref), iconSize (ref), radioGroup (ref), inputSize (ref), divider (ref), getSelectedValue (ref), loading (ref), var1 (ref), textInput (ref), button (ref)
	local var6
	local var7 = foundationModule.Hooks.useTokens()
	local var8, var9 = reactModule.useState(p5.specVersion or "")
	local var10, var11 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), creatorAgentChatModule (copy)
		var11(creatorAgentChatModule.PreviewSpecs.getPreviewSpecsStore(false).refreshPreviewSpecs())
	end, {})
	local var12 = signalsReactModule.useSignalState(if var10 ~= nil then var2 else var10.status)
	local var13 = signalsReactModule.useSignalState(if var10 ~= nil then var3 else var10.data)
	local var14 = reactModule.useMemo(function()
		-- upvalues: getRows (copy), var13 (ref)
		return getRows(var13)
	end, { var13 })
	local var15, var16 = reactModule.useState(nil)
	local var17 = reactModule.useCallback(function(p6)
		-- upvalues: var14 (ref), var9 (ref), var16 (ref)
		for i, v in var14 do
			if v.value == p6 then
				var9(v.override)
				var16(p6)
				
				return
			end
		end
	end, { var14 })
	local _ = nil
	
	if var12 == "Ready" then
		local ceiled = math.ceil(var7.Typography.TitleMedium.FontSize * var7.Typography.TitleMedium.LineHeight)
		local t = {}
		
		for i, v in var14 do
			t[v.value] = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = i }, {
				Row = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small",
					onActivated = function()
						-- upvalues: var17 (ref), v (ref)
						var17(v.value)
					end
				}, {
					Text = reactModule.createElement(view, { LayoutOrder = 1, tag = "col fill gap-xsmall auto-y" }, {
						TitleRow = reactModule.createElement(view, {
							LayoutOrder = 1,
							tag = "row align-y-top gap-xsmall size-full-0 auto-y"
						}, {
							Title = reactModule.createElement(text, {
								LayoutOrder = 2,
								tag = "auto-xy text-title-medium text-wrap text-align-x-left content-emphasis",
								Text = v.title
							}),
							Pin = if v.isPinned then reactModule.createElement(view, {
								LayoutOrder = 1,
								tag = "row align-y-center auto-x",
								Size = UDim2.fromOffset(0, ceiled)
							}, {
								Icon = reactModule.createElement(icon, { name = iconName.Pin, size = iconSize.XSmall })
							}) else nil
						}),
						Description = if v.description then reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy text-body-medium text-wrap text-align-x-left",
							Text = v.description
						}) else nil
					}),
					Radio = reactModule.createElement(radioGroup.Item, {
						LayoutOrder = 2,
						label = "",
						size = inputSize.Medium,
						value = v.value
					})
				}),
				Divider = if i < #var14 then reactModule.createElement(divider, { LayoutOrder = 2 }) else nil
			})
		end
		var6 = reactModule.createElement(radioGroup.Root, {
			Selectable = false,
			tag = "size-full-0 auto-y",
			onValueChanged = var17,
			value = getSelectedValue(var14, var8, var15)
		}, {
			Rows = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, t)
		})
	else
		var6 = if var12 == "Failed" then reactModule.createElement(text, {
			Text = "Preview list unavailable",
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted"
		}) else reactModule.createElement(view, { tag = "row align-y-center gap-small size-full-0 auto-y" }, {
			Spinner = reactModule.createElement(loading, { LayoutOrder = 1, size = iconSize.Small }),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = "Loading previews",
				tag = "auto-xy text-body-medium"
			})
		})
	end
	return reactModule.createElement(var1.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p5.onClose
	}, {
		Header = reactModule.createElement(var1.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				Text = "Agent Spec",
				tag = "auto-xy text-heading-small content-emphasis"
			})
		}),
		Content = reactModule.createElement(var1.Content, nil, { List = var6 }),
		Actions = reactModule.createElement(var1.Actions, nil, {
			Form = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y" }, {
				Input = reactModule.createElement(textInput, {
					LayoutOrder = 1,
					label = "specVersion",
					placeholder = "Leave empty for latest",
					text = var8,
					width = UDim.new(1, 0),
					onChanged = var9
				}),
				Save = reactModule.createElement(button, {
					LayoutOrder = 2,
					text = "Save",
					size = inputSize.Large,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					width = UDim.new(1, 0),
					onActivated = function()
						-- upvalues: p5 (ref), var8 (ref)
						p5.onSave(var8)
						p5.onClose()
					end
				})
			})
		})
	})
end