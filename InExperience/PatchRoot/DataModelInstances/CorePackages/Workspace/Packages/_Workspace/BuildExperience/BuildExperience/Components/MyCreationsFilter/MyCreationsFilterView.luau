local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CreatorGroupRowModule = require(script.Parent.CreatorGroupRow)
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local List = FoundationModule.List
local RadioGroup = FoundationModule.RadioGroup
local SearchInput = FoundationModule.SearchInput
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(Frame) --[[ Line: 61 | Named "MyCreationsFilterView" ]]
	-- upvalues: ReactModule (copy), RadioGroup (copy), InputSize (copy), CreatorGroupRowModule (copy), View (copy), Text (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), Sheet (copy), SearchInput (copy), List (copy), Button (copy), FillBehavior (copy)
	local TestId = Frame.testId or "MyCreationsFilterView"
	local Elements = {}
	
	for LayoutOrder, gamesOption in Frame.gamesOptions do
		Elements[gamesOption.value] = ReactModule.createElement(RadioGroup.Item, {
			LayoutOrder = LayoutOrder,
			value = gamesOption.value,
			label = gamesOption.label,
			size = InputSize.Medium
		})
	end
	local Elements1 = {}
	
	for LayoutOrder1, group in Frame.groups do
		Elements1[`Group{group.id}`] = ReactModule.createElement(CreatorGroupRowModule, {
			LayoutOrder = LayoutOrder1,
			name = group.name,
			icon = group.icon,
			isSelected = group.isSelected,
			onActivated = group.onActivated,
			testId = `{TestId}.Group.{group.id}`
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = Frame.LayoutOrder,
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			},
			testId = `{TestId}.Layout`
		}, {
			Header = ReactModule.createElement(View, {
				tag = {
					["composition-content-body"] = true,
					["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
				},
				testId = TestId
			}, {
				Label = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "fill auto-y text-heading-small text-align-x-left text-truncate-end content-emphasis",
					Text = Frame.label,
					testId = `{TestId}.Label`
				}),
				FilterButton = ReactModule.createElement(IconButton, {
					LayoutOrder = 2,
					icon = IconName.ThreeBarsHorizontalNarrowing,
					onActivated = Frame.onOpenSheet,
					size = InputSize.Small,
					testId = `{TestId}.FilterButton`,
					variant = ButtonVariant.Utility
				})
			})
		}),
		Sheet = ReactModule.createElement(Sheet.Root, {
			isOpen = Frame.isSheetOpen,
			onClose = Frame.onSheetClosed,
			ref = Frame.focusRootRef,
			testId = `{TestId}.Sheet`
		}, {
			Header = ReactModule.createElement(Sheet.Header, nil, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
					Text = Frame.titleText
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, nil, {
				Body = ReactModule.createElement(View, { tag = "col gap-xlarge size-full-0 auto-y" }, {
					Games = ReactModule.createElement(RadioGroup.Root, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y",
						legend = Frame.gamesLegend,
						onValueChanged = Frame.onGamesChanged,
						testId = `{TestId}.Games`,
						value = Frame.selectedGames
					}, Elements),
					Groups = if Frame.isGroupsVisible then ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "col gap-large size-full-0 auto-y",
						testId = `{TestId}.Groups`
					}, {
						Legend = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-title-medium text-wrap text-align-x-left content-emphasis",
							Text = Frame.groupsLegend
						}),
						Search = ReactModule.createElement(SearchInput, {
							LayoutOrder = 2,
							text = Frame.groupSearchText,
							placeholder = Frame.groupSearchPlaceholder,
							onChanged = Frame.onGroupSearchTextChanged,
							size = InputSize.Medium,
							width = UDim.new(1, 0),
							testId = `{TestId}.GroupSearch`
						}),
						List = ReactModule.createElement(List.Root, {
							LayoutOrder = 3,
							hasDivider = true,
							isContained = true,
							size = InputSize.Medium,
							testId = `{TestId}.GroupList`
						}, Elements1)
					}) else nil
				})
			}),
			Actions = ReactModule.createElement(Sheet.Actions, nil, {
				Apply = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = Frame.applyText,
					size = InputSize.Medium,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					onActivated = Frame.onApply,
					testId = `{TestId}.Apply`
				}),
				Reset = ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = Frame.resetText,
					size = InputSize.Medium,
					variant = ButtonVariant.Standard,
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					onActivated = Frame.onReset,
					testId = `{TestId}.Reset`
				})
			})
		})
	})
end