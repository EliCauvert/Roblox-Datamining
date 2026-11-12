local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AgentSpecDebugSheetModule = if require(BuildExperience.Flags.FFlagBuildExperienceModelPicker) then require(BuildExperience.Components.AgentSpecDebug.AgentSpecDebugSheet) else nil
local _ = require(script.Parent.ModelPickerTypes)
local Chip = FoundationModule.Chip
local IconButton = FoundationModule.IconButton
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View

local function Option(Frame)
	-- upvalues: ReactModule (copy), View (copy), FoundationModule (copy), Text (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated,
		isDisabled = Frame.isDisabled,
		selection = { Selectable = not Frame.isDisabled },
		cursor = FoundationModule.Enums.CursorType.RoundedRectNoInset,
		GroupTransparency = if Frame.isDisabled then 0.5 else 0,
		tag = {
			["col gap-xxsmall size-full-0 auto-y padding-medium stroke-standard radius-medium"] = true,
			["stroke-system-contrast"] = Frame.isSelected,
			["stroke-emphasis"] = not Frame.isSelected
		},
		testId = Frame.testId
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = Frame.label
		}),
		Description = if Frame.description then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = Frame.description
		}) else nil
	})
end

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), Option (copy), View (copy), Text (copy), IconButton (copy), Chip (copy), AgentSpecDebugSheetModule (copy), Sheet (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Element = nil
	local InternalTesting = Frame.internalTesting
	local IsSelected = InternalTesting ~= nil and InternalTesting.isSelected
	local PreviewHash = if InternalTesting then InternalTesting.previewHash else nil
	local IsNotPreviewHashMatch: boolean = PreviewHash ~= nil and PreviewHash ~= ""
	
	if Frame.isOpen then
		local Elements = {}
		
		for LayoutOrder, option in Frame.data.options do
			Elements[option.id] = ReactModule.createElement(Option, {
				LayoutOrder = LayoutOrder,
				label = option.label,
				description = if option.isAvailable then option.description else Frame.unavailableText,
				isDisabled = Frame.isDisabled or not option.isAvailable,
				isSelected = not IsSelected and Frame.selectedId == option.id,
				onActivated = function()
					-- upvalues: Frame (copy), option (copy)
					Frame.onSelect(option.id)
				end,
				testId = `ModelPicker.Option.{option.id}`
			})
		end
		local CreateElementFunction = ReactModule.createElement
		local config = {
			tag = "col items-stretch gap-medium size-full-0 auto-y padding-y-xsmall",
			testId = "ModelPicker.Options"
		}
		local config1 = {
			Options = ReactModule.createElement(ReactModule.Fragment, nil, Elements),
			Unavailable = if #Frame.data.options == 0 then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
				Text = Frame.unavailableText
			}) else nil,
			InternalTesting = if InternalTesting then ReactModule.createElement(Option, {
				testId = "ModelPicker.InternalTesting",
				LayoutOrder = #Frame.data.options + 2,
				label = InternalTesting.label,
				description = InternalTesting.description,
				isDisabled = Frame.isDisabled,
				isSelected = IsSelected,
				onActivated = InternalTesting.onSelect
			}) else nil,
			InternalSpec = if InternalTesting and IsSelected then ReactModule.createElement(View, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = #Frame.data.options + 3
			}, {
				Label = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					testId = "ModelPicker.InternalSpec--label",
					Text = InternalTesting.specLabel,
					fontStyle = UseTokensResult.Typography.TitleMedium,
					selection = { Selectable = false },
					stateLayer = {
						affordance = FoundationModule.Enums.StateLayerAffordance.None
					},
					tag = {
						["size-full-0 auto-y text-wrap text-align-x-left"] = true,
						["content-emphasis"] = not Frame.isDisabled,
						["content-muted"] = Frame.isDisabled
					}
				}),
				Button = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "size-full-1000 stroke-standard stroke-emphasis radius-medium clip",
					testId = "ModelPicker.InternalSpec--container"
				}, {
					Open = ReactModule.createElement(View, {
						ZIndex = 1,
						tag = "size-full radius-medium",
						testId = "ModelPicker.InternalSpec",
						onActivated = InternalTesting.onOpenSpec,
						isDisabled = Frame.isDisabled,
						selection = { Selectable = not Frame.isDisabled },
						cursor = FoundationModule.Enums.CursorType.RoundedRectNoInset,
						GroupTransparency = if Frame.isDisabled then 0.5 else 0,
						padding = {
							left = UDim.new(0, UseTokensResult.Padding.Small),
							right = UDim.new(0, UseTokensResult.Padding.Small + UseTokensResult.Size.Size_800)
						}
					}, {
						Value = ReactModule.createElement(Text, {
							testId = "ModelPicker.InternalSpec--value",
							Text = if PreviewHash == nil or PreviewHash == "" then InternalTesting.placeholder else PreviewHash,
							tag = {
								["size-full text-body-medium text-align-x-left text-truncate-end"] = true,
								["content-emphasis"] = IsNotPreviewHashMatch,
								["content-muted"] = not IsNotPreviewHashMatch
							}
						})
					}),
					Clear = ReactModule.createElement(IconButton, {
						ZIndex = 2,
						testId = "ModelPicker.InternalSpec--clear",
						AnchorPoint = Vector2.new(1, 0.5),
						Position = UDim2.new(1, -UseTokensResult.Padding.Small, 0.5, 0),
						icon = FoundationModule.Enums.IconName.X,
						size = FoundationModule.Enums.InputSize.Small,
						variant = FoundationModule.Enums.ButtonVariant.Utility,
						isDisabled = Frame.isDisabled or not IsNotPreviewHashMatch,
						onActivated = InternalTesting.onClearSpec
					})
				}),
				Hint = ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
					Text = InternalTesting.hint
				})
			}) else nil
		}
		Element = if #Frame.data.options == 0 and InternalTesting == nil then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
			Text = Frame.unavailableText
		}) else CreateElementFunction(View, config, config1)
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Chip = ReactModule.createElement(View, {
			tag = "auto-xy stroke-standard stroke-default radius-circle",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Control = ReactModule.createElement(Chip, {
				testId = "ModelPicker.Chip",
				text = Frame.label,
				trailing = FoundationModule.Enums.IconName.ChevronLargeDown,
				size = FoundationModule.Enums.ChipSize.Medium,
				variant = FoundationModule.Enums.ChipVariant.Utility,
				isDisabled = Frame.isDisabled,
				onActivated = Frame.onOpen
			})
		}),
		AgentSpecSheet = if Frame.isSpecOpen and InternalTesting then ReactModule.createElement(AgentSpecDebugSheetModule, {
			testId = "ModelPicker.AgentSpecSheet",
			specVersion = InternalTesting.previewHash,
			onSave = InternalTesting.onSaveSpec,
			onClose = Frame.onCloseSpec,
			focusRootRef = Frame.focusRootRef,
			hasCloseAffordance = Frame.hasCloseAffordance
		}) else nil,
		Sheet = if Frame.isOpen then ReactModule.createElement(Sheet.Root, {
			isOpen = true,
			preferCenterSheet = true,
			testId = "ModelPicker.Sheet",
			onClose = Frame.onClose,
			ref = Frame.focusRootRef
		}, {
			Header = ReactModule.createElement(Sheet.Header, {
				hasCloseAffordance = if Frame.hasCloseAffordance then nil else false
			}, {
				Title = ReactModule.createElement(Text, {
					tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
					Text = Frame.title
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, nil, { Body = Element })
		}) else nil
	})
end