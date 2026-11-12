local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Avatar = FoundationModule.Avatar
local Button = FoundationModule.Button
local TextInput = FoundationModule.TextInput
local SearchInput = FoundationModule.SearchInput
local Toggle = FoundationModule.Toggle
local Chip = FoundationModule.Chip
local Menu = FoundationModule.Menu
local ScrollView = FoundationModule.ScrollView
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Dialog = FoundationModule.Dialog
local AvatarSize = FoundationModule.Enums.AvatarSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local IconName = FoundationModule.Enums.IconName
local InputFocusBehavior = FoundationModule.Enums.InputFocusBehavior
local InputSize = FoundationModule.Enums.InputSize
local Orientation = FoundationModule.Enums.Orientation

local function renderPlayerRow(p1, p2, LayoutOrder)
	-- upvalues: ReactModule (copy), View (copy), Avatar (copy), AvatarSize (copy), Text (copy), Button (copy), IconName (copy), ButtonVariant (copy), InputSize (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = LayoutOrder
	}, {
		Avatar = ReactModule.createElement(Avatar, {
			LayoutOrder = 1,
			userId = p2.userId,
			size = AvatarSize.Small
		}),
		Name = ReactModule.createElement(Text, {
			tag = "fill auto-xy text-body-medium text-align-x-left text-truncate-end content-default",
			LayoutOrder = 2,
			Text = p2.displayName
		}),
		AddButton = ReactModule.createElement(Button, {
			LayoutOrder = 3,
			testId = `--purchase-prompt-button-add-player-{p1.userId}`,
			text = p1.locales.add,
			icon = if p2.isAdded then IconName.Check else IconName.PlusLarge,
			variant = if p2.isAdded then ButtonVariant.SoftEmphasis else ButtonVariant.Standard,
			size = InputSize.Small,
			onActivated = p2.onToggleAdded
		})
	})
end

local function renderPlayerList(ViewProps)
	-- upvalues: renderPlayerRow (copy), ReactModule (copy), Text (copy)
	local t = {}
	
	for i, player in ViewProps.players do
		t[`Player{player.userId}`] = renderPlayerRow(ViewProps, player, i)
	end
	if #ViewProps.players == 0 then
		t.Empty = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium text-align-x-left content-muted",
			Text = ViewProps.locales.noOne
		})
	end
	t.MaxHeight = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, 180) })
	
	return t
end

local function renderAddedPlayerChips(ViewProps)
	-- upvalues: ReactModule (copy), Chip (copy), IconName (copy), View (copy)
	if #ViewProps.addedPlayers == 0 then
		return nil
	end
	local Elements = {}
	
	for LayoutOrder, addedPlayer in ViewProps.addedPlayers do
		Elements[`Added{addedPlayer.userId}`] = ReactModule.createElement(Chip, {
			testId = `--purchase-prompt-chip-added-player-{addedPlayer.userId}`,
			text = addedPlayer.displayName,
			leading = {
				type = "AvatarGroup",
				props = { avatars = { addedPlayer.userId } }
			},
			trailing = IconName.X,
			onActivated = addedPlayer.onRemove,
			LayoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement(View, {
		tag = "row wrap gap-small size-full-0 auto-y",
		LayoutOrder = 3
	}, Elements)
end

local function PeopleSearch(Frame)
	-- upvalues: ReactModule (copy), View (copy), SearchInput (copy), Menu (copy)
	local ViewProps = Frame.viewProps
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local SearchResults = ViewProps.searchResults
	local OnSearchTextChangedFunction = ViewProps.onSearchTextChanged
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SearchResults (copy)
		local List = {}
		
		for _, searchResult in SearchResults do
			table.insert(List, {
				id = searchResult.userId,
				text = searchResult.displayName,
				leading = { type = "Avatar", userId = searchResult.userId }
			})
		end
		return List
	end, { SearchResults })
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		ref = UseRefResult,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X)
		end, {}),
		LayoutOrder = Frame.LayoutOrder
	}, {
		Search = ReactModule.createElement(SearchInput, {
			testId = "--purchase-prompt-searchinput-people",
			text = ViewProps.searchText,
			placeholder = ViewProps.locales.searchPeople,
			onChanged = ReactModule.useCallback(function(p1)
				-- upvalues: UseStateResult2_1 (copy), OnSearchTextChangedFunction (copy)
				UseStateResult2_1(false)
				OnSearchTextChangedFunction(p1)
			end, { OnSearchTextChangedFunction }),
			width = UDim.new(1, 0)
		}),
		Results = ReactModule.createElement(Menu, {
			testId = "--purchase-prompt-menu-search-results",
			maxHeight = 240,
			isOpen = #UseMemoResult > 0 and not UseStateResult1,
			items = UseMemoResult,
			anchorRef = UseRefResult,
			width = UDim.new(0, UseStateResult),
			onPressedOutside = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(true)
			end, {}),
			onActivated = ReactModule.useCallback(function(UserId)
				-- upvalues: SearchResults (copy)
				for _, searchResult in SearchResults do
					if searchResult.userId == UserId then
						searchResult.onSelected()
						break
					end
				end
			end, { SearchResults })
		})
	})
end

local function renderPrivateServerLink(ViewProps)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), TextInput (copy), InputFocusBehavior (copy), IconName (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = 4
	}, {
		Header = ReactModule.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Text = ReactModule.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
				Heading = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-small content-emphasis",
					LayoutOrder = 1,
					Text = ViewProps.locales.privateServerLink
				}),
				Description = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-small content-muted",
					LayoutOrder = 2,
					Text = ViewProps.locales.anyoneWithThisLinkCanJoin
				})
			}),
			Generate = if ViewProps.link == nil then ReactModule.createElement(Button, {
				testId = "--purchase-prompt-button-generate-link",
				LayoutOrder = 2,
				text = ViewProps.locales.generate,
				variant = ButtonVariant.Standard,
				size = InputSize.Small,
				isLoading = ViewProps.isGeneratingLink,
				onActivated = ViewProps.onGenerateLink
			}) else nil
		}),
		Field = ReactModule.createElement(TextInput, {
			testId = "--purchase-prompt-textinput-link",
			label = "",
			LayoutOrder = 2,
			text = ViewProps.linkText,
			placeholder = ViewProps.locales.generateLinkPlaceholder,
			onChanged = ViewProps.onLinkTextChanged,
			isDisabled = ViewProps.link == nil,
			focusBehavior = InputFocusBehavior.Highlight,
			iconTrailing = if ViewProps.link then {
				name = if ViewProps.isLinkCopied then IconName.Check else IconName.TwoStackedSquares,
				onActivated = ViewProps.onCopyLink
			} else nil,
			width = UDim.new(1, 0)
		})
	})
end

return function(ViewProps)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), TextInput (copy), Text (copy), PeopleSearch (copy), renderAddedPlayerChips (copy), ScrollView (copy), renderPlayerList (copy), Toggle (copy), renderPrivateServerLink (copy), Orientation (copy), ButtonVariant (copy)
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = true,
		testId = "VIPServerConfigurationView",
		size = DialogSize.Medium,
		onClose = if ViewProps.isSaving then nil else ViewProps.onCancel
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = ViewProps.locales.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
				ServerName = ReactModule.createElement(TextInput, {
					testId = "--purchase-prompt-textinput-server-name",
					LayoutOrder = 1,
					label = ViewProps.locales.serverName,
					text = ViewProps.serverName,
					onChanged = ViewProps.onServerNameChanged,
					width = UDim.new(1, 0)
				}),
				WhoCanJoin = ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					Heading = ReactModule.createElement(Text, {
						tag = "auto-xy text-heading-small content-emphasis",
						LayoutOrder = 1,
						Text = ViewProps.locales.whoCanJoin
					}),
					Search = ReactModule.createElement(PeopleSearch, { LayoutOrder = 2, viewProps = ViewProps }),
					AddedPlayers = renderAddedPlayerChips(ViewProps),
					InThisServer = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-small content-default",
						LayoutOrder = 4,
						Text = ViewProps.locales.inThisServer
					}),
					PlayerList = ReactModule.createElement(ScrollView, {
						LayoutOrder = 5,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, UseTokensFunction().Gap.Small)
						},
						scroll = {
							ScrollingDirection = Enum.ScrollingDirection.Y,
							AutomaticSize = Enum.AutomaticSize.Y,
							AutomaticCanvasSize = Enum.AutomaticSize.Y,
							CanvasSize = UDim2.fromScale(0, 0)
						}
					}, (renderPlayerList(ViewProps)))
				}),
				FriendsAllowed = ReactModule.createElement(View, {
					tag = "row align-y-center gap-medium size-full-0 auto-y",
					LayoutOrder = 3
				}, {
					Text = ReactModule.createElement(View, { tag = "col fill gap-xxsmall auto-y", LayoutOrder = 1 }, {
						Label = ReactModule.createElement(Text, {
							tag = "auto-xy text-body-medium content-emphasis",
							LayoutOrder = 1,
							Text = ViewProps.locales.friendsAllowed
						}),
						Description = ReactModule.createElement(Text, {
							tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-muted",
							LayoutOrder = 2,
							Text = ViewProps.locales.friendsAllowedDescription
						})
					}),
					Toggle = ReactModule.createElement(Toggle, {
						testId = "--purchase-prompt-toggle-friends-allowed",
						label = "",
						LayoutOrder = 2,
						isChecked = ViewProps.friendsAllowed,
						onActivated = ViewProps.onFriendsAllowedChanged
					})
				}),
				PrivateServerLink = renderPrivateServerLink(ViewProps),
				Error = if ViewProps.hasError then ReactModule.createElement(Text, {
					testId = "--purchase-prompt-text-error",
					tag = "auto-xy text-body-medium content-system-alert",
					LayoutOrder = 5,
					Text = ViewProps.locales.somethingWentWrong
				}) else nil
			})
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Horizontal,
			actions = {
				{
					testId = "--purchase-prompt-button-continue",
					text = ViewProps.locales["continue"],
					variant = ButtonVariant.Emphasis,
					onActivated = ViewProps.onSave,
					isLoading = ViewProps.isSaving
				}
			}
		})
	})
end