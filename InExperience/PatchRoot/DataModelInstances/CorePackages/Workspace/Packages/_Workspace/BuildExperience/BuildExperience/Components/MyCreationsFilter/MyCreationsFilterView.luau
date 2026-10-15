local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local creatorGroupRowModule = require(script.Parent.CreatorGroupRow)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local list = foundationModule.List
local radioGroup = foundationModule.RadioGroup
local searchInput = foundationModule.SearchInput
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), radioGroup (ref), inputSize (ref), creatorGroupRowModule (ref), view (ref), text (ref), iconButton (ref), iconName (ref), buttonVariant (ref), sheet (ref), searchInput (ref), list (ref), button (ref), fillBehavior (ref)
	local testId = p1.testId or "MyCreationsFilterView"
	local t = {}
	
	for i, v in p1.gamesOptions do
		t[v.value] = reactModule.createElement(radioGroup.Item, {
			LayoutOrder = i,
			value = v.value,
			label = v.label,
			size = inputSize.Medium
		})
	end
	local t_1 = {}
	
	for i_1, v_1 in p1.groups do
		t_1[`Group{v_1.id}`] = reactModule.createElement(creatorGroupRowModule, {
			LayoutOrder = i_1,
			name = v_1.name,
			icon = v_1.icon,
			isSelected = v_1.isSelected,
			onActivated = v_1.onActivated,
			testId = `{testId}.Group.{v_1.id}`
		})
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		Header = reactModule.createElement(view, {
			LayoutOrder = p1.LayoutOrder,
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			},
			testId = `{testId}.Layout`
		}, {
			Header = reactModule.createElement(view, {
				tag = {
					["composition-content-body"] = true,
					["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
				},
				testId = testId
			}, {
				Label = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "fill auto-y text-heading-small text-align-x-left text-truncate-end content-emphasis",
					Text = p1.label,
					testId = `{testId}.Label`
				}),
				FilterButton = reactModule.createElement(iconButton, {
					LayoutOrder = 2,
					icon = iconName.ThreeBarsHorizontalNarrowing,
					onActivated = p1.onOpenSheet,
					size = inputSize.Small,
					testId = `{testId}.FilterButton`,
					variant = buttonVariant.Utility
				})
			})
		}),
		Sheet = reactModule.createElement(sheet.Root, {
			isOpen = p1.isSheetOpen,
			onClose = p1.onSheetClosed,
			ref = p1.focusRootRef,
			testId = `{testId}.Sheet`
		}, {
			Header = reactModule.createElement(sheet.Header, nil, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
					Text = p1.titleText
				})
			}),
			Content = reactModule.createElement(sheet.Content, nil, {
				Body = reactModule.createElement(view, { tag = "col gap-xlarge size-full-0 auto-y" }, {
					Games = reactModule.createElement(radioGroup.Root, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y",
						legend = p1.gamesLegend,
						onValueChanged = p1.onGamesChanged,
						testId = `{testId}.Games`,
						value = p1.selectedGames
					}, t),
					Groups = if p1.isGroupsVisible then reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "col gap-large size-full-0 auto-y",
						testId = `{testId}.Groups`
					}, {
						Legend = reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "auto-xy text-title-medium text-wrap text-align-x-left content-emphasis",
							Text = p1.groupsLegend
						}),
						Search = reactModule.createElement(searchInput, {
							LayoutOrder = 2,
							text = p1.groupSearchText,
							placeholder = p1.groupSearchPlaceholder,
							onChanged = p1.onGroupSearchTextChanged,
							size = inputSize.Medium,
							width = UDim.new(1, 0),
							testId = `{testId}.GroupSearch`
						}),
						List = reactModule.createElement(list.Root, {
							LayoutOrder = 3,
							hasDivider = true,
							isContained = true,
							size = inputSize.Medium,
							testId = `{testId}.GroupList`
						}, t_1)
					}) else nil
				})
			}),
			Actions = reactModule.createElement(sheet.Actions, nil, {
				Apply = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = p1.applyText,
					size = inputSize.Medium,
					variant = buttonVariant.Emphasis,
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					onActivated = p1.onApply,
					testId = `{testId}.Apply`
				}),
				Reset = reactModule.createElement(button, {
					LayoutOrder = 2,
					text = p1.resetText,
					size = inputSize.Medium,
					variant = buttonVariant.Standard,
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					onActivated = p1.onReset,
					testId = `{testId}.Reset`
				})
			})
		})
	})
end