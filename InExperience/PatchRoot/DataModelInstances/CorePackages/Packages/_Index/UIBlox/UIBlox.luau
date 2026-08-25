local makeConfigurableModule = require(script.Core.Config.makeConfigurable)
local UIBloxDefaultConfigModule = require(script.UIBloxDefaultConfig)
local createLazyComponentModule = require(script.Utility.createLazyComponent)
local _ = require(script.App.Style.Fonts)
local _ = require(script.App.ImageSet.ImagesTypes)
local _ = require(script.App.Style.StyleTypes)
local _ = require(script.Core.Layout.Responsive.ResponsiveLayoutConfigReader)
local overlayModule = require(script.App.Dialog.Overlay.Overlay)
local controlStateModule = require(script.Core.Control.Enum.ControlState)
local _ = require(script.Parent.React)

return makeConfigurableModule(function(p0)
	-- upvalues: createLazyComponentModule (ref), controlStateModule (ref), overlayModule (ref)
	local strictModule = require(script.Utility.strict)
	
	local function _(p1)
		-- upvalues: createLazyComponentModule (copy)
		return createLazyComponentModule(p1)
	end
	
	local t = {
		Core = strictModule({
			Layout = strictModule({
				Responsive = strictModule({
					ResponsiveLayoutProvider = require(script.Core.Layout.Responsive.ResponsiveLayoutProvider),
					useResponsiveLayout = require(script.Core.Layout.Responsive.useResponsiveLayout)
				}),
				Grid = strictModule({
					withGridConfig_DEPRECATED = require(script.Core.Layout.Grid.withGridConfig_DEPRECATED)
				}),
				LayerCollector = strictModule({
					LayerCollectorProvider = require(script.Core.Layout.LayerCollector.LayerCollectorProvider),
					useLayerCollector = require(script.Core.Layout.LayerCollector.useLayerCollector)
				})
			}),
			Animation = strictModule({
				withAnimation = require(script.Core.Animation.withAnimation)
			}),
			ImageSet = strictModule({
				ImageSetButton = require(script.Core.ImageSet.ImageSetComponent).Button,
				ImageSetLabel = require(script.Core.ImageSet.ImageSetComponent).Label,
				Validator = strictModule({
					validateImage = require(script.Core.ImageSet.Validator.validateImage)
				})
			}),
			Control = strictModule({
				Enum = strictModule({ ControlState = controlStateModule }),
				Interactable = createLazyComponentModule(function()
					return require(script.Core.Control.Interactable)
				end),
				StateLayer = createLazyComponentModule(function()
					return require(script.Core.Control.StateLayer)
				end),
				FeedbackManagerInjectionContext = require(script.Core.Control.FeedbackManagerInjectionContext)
			}),
			Style = strictModule({
				Provider = require(script.Core.Style.StyleProvider),
				withStyle = require(script.Core.Style.withStyle),
				useStyle = require(script.Core.Style.useStyle),
				useTextSizeOffset = require(script.Core.Style.useTextSizeOffset),
				withTextSizeOffset = require(script.Core.Style.withTextSizeOffset),
				useStyleMetadata = require(script.Core.Style.useStyleMetadata)
			}),
			VR = strictModule({
				Panel3D = createLazyComponentModule(function()
					return require(script.Core.VR.Panel3D)
				end),
				Constants = require(script.Core.VR.Constants),
				PointerOverlay = createLazyComponentModule(function()
					return require(script.Core.VR.PointerOverlay)
				end)
			}),
			Text = strictModule({
				ExpandableText = strictModule({
					GetCanExpand = require(script.Core.Text.ExpandableText.ExpandableTextUtils).getCanExpand
				}),
				EmojiTextLabel = createLazyComponentModule(function()
					return require(script.Core.Text.EmojiTextLabel.EmojiTextLabel)
				end)
			}),
			Enums = strictModule({ InputType = require(script.Enums.InputType) })
		}),
		Common = strictModule({
			Style = strictModule({ ColorSystem = require(script.Common.Style.ColorSystem) })
		}),
		App = strictModule({
			Context = strictModule({
				ContentProvider = require(script.App.Context.ContentProvider)
			}),
			ImageSet = strictModule({
				Images = require(script.App.ImageSet.Images),
				getIconSize = require(script.App.ImageSet.getIconSize),
				getIconSizeUDim2 = require(script.App.ImageSet.getIconSizeUDim2),
				Enum = strictModule({ IconSize = require(script.App.ImageSet.Enum.IconSize) })
			}),
			Bar = strictModule({
				HeaderBar = createLazyComponentModule(function()
					return require(script.App.Bar.HeaderBar)
				end),
				FullscreenTitleBar = createLazyComponentModule(function()
					return require(script.App.Bar.FullscreenTitleBar)
				end),
				ControllerBar = createLazyComponentModule(function()
					return require(script.App.Bar.ControllerBar)
				end)
			}),
			Button = strictModule({
				Enum = strictModule({
					ButtonType = require(script.App.Button.Enum.ButtonType),
					StandardButtonSize = require(script.Core.Button.Enum.StandardButtonSize)
				}),
				Button = createLazyComponentModule(function()
					return require(script.App.Button.Button)
				end),
				ButtonStack = createLazyComponentModule(function()
					return require(script.App.Button.ButtonStack)
				end),
				TextButton = createLazyComponentModule(function()
					return require(script.App.Button.TextButton)
				end),
				LinkButton = createLazyComponentModule(function()
					return require(script.App.Button.LinkButton)
				end),
				IconButton = createLazyComponentModule(function()
					return require(script.App.Button.IconButton)
				end),
				ActionBar = createLazyComponentModule(function()
					return require(script.App.Button.ActionBar)
				end),
				UtilityActionIcon = createLazyComponentModule(function()
					return require(script.App.Button.UtilityActionIcon)
				end),
				ComboButton = createLazyComponentModule(function()
					return require(script.App.Button.ComboButton)
				end)
			}),
			Cell = strictModule({
				Small = strictModule({
					SelectionGroup = strictModule({
						SmallRadioButtonGroup = createLazyComponentModule(function()
							return require(script.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup)
						end)
					})
				})
			}),
			Text = strictModule({
				ExpandableTextArea = createLazyComponentModule(function()
					return require(script.App.Text.ExpandableTextArea.ExpandableTextArea)
				end),
				StyledTextLabel = createLazyComponentModule(function()
					return require(script.App.Text.StyledTextLabel)
				end)
			}),
			Loading = strictModule({
				Enum = strictModule({
					RetrievalStatus = require(script.App.Loading.Enum.RetrievalStatus),
					LoadingStrategy = require(script.App.Loading.Enum.LoadingStrategy)
				}),
				LoadableImage = createLazyComponentModule(function()
					return require(script.App.Loading.LoadableImage)
				end)
			}),
			InputButton = strictModule({
				RadioButtonList = createLazyComponentModule(function()
					return require(script.App.InputButton.RadioButtonList)
				end)
			}),
			Container = strictModule({
				Enum = strictModule({
					ScrollBarType = require(script.App.Container.Enum.ScrollBarType)
				}),
				Carousel = strictModule({
					FreeFlowCarousel = createLazyComponentModule(function()
						return require(script.App.Container.Carousel.FreeFlowCarousel)
					end)
				}),
				Grid = strictModule({
					ResponsiveGrid = createLazyComponentModule(function()
						return require(script.App.Container.Grid.ResponsiveGrid)
					end)
				}),
				VerticalScrollView = createLazyComponentModule(function()
					return require(script.App.Container.VerticalScrollView)
				end),
				VerticalScrollViewWithMargin = require(script.App.Container.VerticalScrollViewWithMargin),
				getPageMargin = require(script.App.Container.getPageMargin),
				LoadingStateContainer = createLazyComponentModule(function()
					return require(script.App.Container.LoadingStateContainer)
				end),
				LoadingStatePage = createLazyComponentModule(function()
					return require(script.App.Container.LoadingStatePage)
				end),
				HorizontalPageMargin = createLazyComponentModule(function()
					return require(script.App.Container.HorizontalPageMargin)
				end)
			}),
			Slider = strictModule({
				ContextualSlider = createLazyComponentModule(function()
					return require(script.App.Slider.ContextualSlider)
				end),
				SystemSlider = createLazyComponentModule(function()
					return require(script.App.Slider.SystemSlider)
				end)
			}),
			Emoji = strictModule({
				Enum = strictModule({ Emoji = require(script.Core.Emoji.Enum.Emoji) })
			}),
			Grid = strictModule({
				GridView = createLazyComponentModule(function()
					return require(script.App.Grid.GridView)
				end),
				GridMetrics = require(script.App.Grid.GridMetrics),
				DefaultMetricsGridView = createLazyComponentModule(function()
					return require(script.App.Grid.DefaultMetricsGridView)
				end)
			}),
			Tile = strictModule({
				MenuTile = createLazyComponentModule(function()
					return require(script.App.Tile.MenuTile.MenuTile)
				end),
				PlayerTile = createLazyComponentModule(function()
					return require(script.App.Tile.PlayerTile.PlayerTile)
				end),
				ExperienceTileV3 = createLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceTileV3)
				end),
				AspectRatioModeEnum = require(script.App.Tile.SplitTile.ExperienceTile.Enum.AspectRatioMode),
				getExperienceTileRelativeHeight = require(script.App.Tile.SplitTile.ExperienceTile.getExperienceTileRelativeHeight),
				ExperienceActionRow = createLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceActionRow)
				end),
				VerticalTile = createLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.VerticalTile.VerticalTile)
				end),
				VerticalTileThumbnail = createLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.VerticalTile.VerticalTileThumbnail)
				end),
				ExperienceTileMetadata = strictModule({
					SocialProofFooter = createLazyComponentModule(function()
						return require(script.App.Tile.ExperienceTileMetadata.SocialProofFooter)
					end),
					CoPlayFooter = createLazyComponentModule(function()
						return require(script.App.Tile.ExperienceTileMetadata.CoPlayFooter)
					end),
					TextFooter = createLazyComponentModule(function()
						return require(script.App.Tile.ExperienceTileMetadata.TextFooter)
					end)
				})
			}),
			Dialog = strictModule({
				Modal = strictModule({
					FullPageModal = createLazyComponentModule(function()
						return require(script.App.Dialog.Modal.FullPageModal)
					end),
					getPartialPageModalMiddleContentWidth = require(script.App.Dialog.Modal.getPartialPageModalMiddleContentWidth),
					PartialPageModal = createLazyComponentModule(function()
						return require(script.App.Dialog.Modal.PartialPageModal)
					end),
					EducationalModal = createLazyComponentModule(function()
						return require(script.App.Dialog.Modal.EducationalModal)
					end),
					ModalWindow = createLazyComponentModule(function()
						return require(script.App.Dialog.Modal.ModalWindow)
					end)
				}),
				Alert = strictModule({
					InteractiveAlert = createLazyComponentModule(function()
						return require(script.App.Dialog.Alert.InteractiveAlert)
					end),
					LoadingAlert = createLazyComponentModule(function()
						return require(script.App.Dialog.Alert.LoadingAlert)
					end)
				}),
				Enum = strictModule({
					CloseButtonIcon = require(script.App.Dialog.Modal.Enum.CloseButtonIcon),
					TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation)
				}),
				Toast = createLazyComponentModule(function()
					return require(script.App.Dialog.Toast.Toast)
				end),
				Tooltip = createLazyComponentModule(function()
					return require(script.App.Dialog.Tooltip.Tooltip)
				end),
				TooltipV2 = require(script.App.Dialog.TooltipV2.Controllers),
				TooltipCallout = createLazyComponentModule(function()
					return require(script.App.Dialog.TooltipV2.TooltipCallout)
				end),
				TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation),
				Overlay = overlayModule
			}),
			Constant = strictModule({ IconSize = require(script.App.Constant.IconSize) }),
			Style = strictModule({
				AppStyleProvider = require(script.App.Style.AppStyleProvider),
				Colors = require(script.App.Style.Colors),
				Constants = require(script.App.Style.Constants),
				Themes = {
					DarkTheme = require(script.App.Style.Themes.DarkTheme),
					LightTheme = require(script.App.Style.Themes.LightTheme)
				},
				Tokens = require(script.App.Style.Tokens)
			}),
			Indicator = strictModule({
				Badge = createLazyComponentModule(function()
					return require(script.App.Indicator.Badge)
				end),
				EmptyState = createLazyComponentModule(function()
					return require(script.App.Indicator.EmptyState)
				end),
				Enum = strictModule({
					BadgeStates = require(script.App.Indicator.Enum.BadgeStates),
					BadgeVariant = require(script.App.Indicator.Enum.BadgeVariant),
					VoteStates = require(script.App.Indicator.Enum.VoteStates)
				}),
				PlayerContext = require(script.App.Indicator.PlayerContext),
				PlayerCount = createLazyComponentModule(function()
					return require(script.App.Indicator.PlayerCount)
				end),
				RateCount = createLazyComponentModule(function()
					return require(script.App.Indicator.RateCount)
				end),
				StatWidget = createLazyComponentModule(function()
					return require(script.App.Indicator.StatWidget)
				end),
				StatGroup = createLazyComponentModule(function()
					return require(script.App.Indicator.StatGroup)
				end),
				PlayerName = createLazyComponentModule(function()
					return require(script.App.Indicator.PlayerName)
				end)
			}),
			Menu = strictModule({
				BaseMenu = createLazyComponentModule(function()
					return require(script.App.Menu.BaseMenu)
				end),
				ContextualMenu = createLazyComponentModule(function()
					return require(script.App.Menu.ContextualMenu)
				end),
				MenuDirection = require(script.App.Menu.MenuDirection),
				DropdownMenu = createLazyComponentModule(function()
					return require(script.App.Menu.DropdownMenu)
				end),
				KeyLabel = createLazyComponentModule(function()
					return require(script.App.Menu.KeyLabel.KeyLabel)
				end),
				KeyLabelUtilities = require(script.App.Menu.KeyLabel.Utilities)
			}),
			Control = strictModule({
				SegmentedControl = createLazyComponentModule(function()
					return require(script.App.Control.SegmentedControl)
				end),
				Pill = createLazyComponentModule(function()
					return require(script.App.Control.Pill.Pill)
				end),
				Pillv2 = createLazyComponentModule(function()
					return require(script.App.Control.Pill.Pillv2)
				end),
				Slot = strictModule({
					SlotTray = createLazyComponentModule(function()
						return require(script.App.Control.Slot.SlotTray)
					end)
				}),
				PillGroup = createLazyComponentModule(function()
					return require(script.App.Control.Pill.PillGroup)
				end)
			}),
			Navigation = strictModule({
				Enum = strictModule({
					Placement = require(script.App.Navigation.Enum.Placement),
					NavigationBarAlignment = require(script.App.Navigation.Enum.NavigationBarAlignment),
					NavigationRailAlignment = require(script.App.Navigation.Enum.NavigationRailAlignment),
					NavigationTabLayout = require(script.App.Navigation.Enum.NavigationTabLayout)
				}),
				SystemBar = createLazyComponentModule(function()
					return require(script.App.Navigation.SystemBar)
				end),
				NavigationBar = createLazyComponentModule(function()
					return require(script.App.Navigation.NavigationBar)
				end),
				NavigationRailV2 = createLazyComponentModule(function()
					return require(script.App.Navigation.NavigationRailV2)
				end),
				NavigationTab = require(script.App.Navigation.NavigationTab),
				PrimaryNavBar = strictModule({
					IconTabGroup = createLazyComponentModule(function()
						return require(script.App.Navigation.PrimaryNavBar.IconTabGroup)
					end)
				}),
				ShortcutBar = createLazyComponentModule(function()
					return require(script.App.Navigation.ShortcutBar.ShortcutBar)
				end),
				Shortcut = createLazyComponentModule(function()
					return require(script.App.Navigation.ShortcutBar.Shortcut)
				end)
			}),
			SelectionImage = strictModule({
				SelectionCursorProvider = require(script.App.SelectionImage.SelectionCursorProvider),
				CursorKind = require(script.App.SelectionImage.CursorKind),
				withSelectionCursorProvider = require(script.App.SelectionImage.withSelectionCursorProvider),
				useSelectionCursor = require(script.App.SelectionImage.useSelectionCursor)
			}),
			SelectionCursor = strictModule({
				CursorProvider = require(script.App.SelectionCursor.CursorProvider),
				useCursor = require(script.App.SelectionCursor.useCursor),
				useCursorByType = require(script.App.SelectionCursor.useCursorByType),
				CursorType = require(script.App.SelectionCursor.CursorType)
			}),
			Table = strictModule({
				ListTable = createLazyComponentModule(function()
					return require(script.App.Table.ListTable)
				end),
				ScrollingListTable = createLazyComponentModule(function()
					return require(script.App.Table.ScrollingListTable)
				end),
				Cell = createLazyComponentModule(function()
					return require(script.App.Table.Cell)
				end),
				CellHeadDetail = createLazyComponentModule(function()
					return require(script.App.Table.CellHeadDetail)
				end),
				CellTailDescription = createLazyComponentModule(function()
					return require(script.App.Table.CellTailDescription)
				end)
			}),
			Input = strictModule({
				TextField = createLazyComponentModule(function()
					return require(script.App.Input.TextField)
				end)
			})
		}),
		UnitTestHelpers = {
			MockContentProvider = require(script.UnitTestHelpers.MockContentProvider)
		}
	}
	t.Style = {
		Provider = t.Core.Style.Provider,
		withStyle = t.Core.Style.withStyle,
		Validator = {
			validateStyle = require(script.App.Style.Validator.validateStyle),
			validateFontInfo = require(script.Core.Style.Validator.validateFontInfo),
			validateTypographyInfo = require(script.Core.Style.Validator.validateTypographyInfo),
			validateColorInfo = require(script.Core.Style.Validator.validateColorInfo)
		},
		Context = require(script.Core.Style.StyleContext)
	}
	t.AccordionView = createLazyComponentModule(function()
		return require(script.App.Accordion.AccordionView)
	end)
	t.Tile = {
		SaveTile = createLazyComponentModule(function()
			return require(script.App.Tile.SaveTile.SaveTile)
		end),
		ItemTile = createLazyComponentModule(function()
			return require(script.App.Tile.ItemTile.ItemTile)
		end),
		ItemTileEnums = require(script.App.Tile.Enum.ItemTileEnums)
	}
	t.Utility = {
		SpringAnimatedItem = require(script.Utility.SpringAnimatedItem),
		OpenTypeSupport = require(script.Utility.OpenTypeSupport)
	}
	t.ModalBottomSheet = createLazyComponentModule(function()
		return require(script.ModalBottomSheet.ModalBottomSheet)
	end)
	
	if _G.__UIBLOX_TRACK_USAGE__ then
		local usageTrackerModule = require(script.Parent.UsageTracker)
		t = usageTrackerModule.trackMemberAccess("UIBlox", t, usageTrackerModule.isReactComponent)
	end
	if p0.enableTraceLevelLog then
		require(script.Logger):enableTraceLog()
	end
	return t
end, "UIBlox", UIBloxDefaultConfigModule)