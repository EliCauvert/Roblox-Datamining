local CreateLazyComponentModule = require(script.Utility.createLazyComponent)
local _ = require(script.App.Style.Fonts)
local _ = require(script.App.ImageSet.ImagesTypes)
local _ = require(script.App.Style.StyleTypes)
local _ = require(script.Core.Layout.Responsive.ResponsiveLayoutConfigReader)
local OverlayModule = require(script.App.Dialog.Overlay.Overlay)
local ControlStateModule = require(script.Core.Control.Enum.ControlState)
local _ = require(script.Parent.React)

return (require(script.Core.Config.makeConfigurable)(function(p1)
	-- upvalues: CreateLazyComponentModule (copy), ControlStateModule (copy), OverlayModule (copy)
	local StrictModule = require(script.Utility.strict)
	
	local function _(p2)
		-- upvalues: CreateLazyComponentModule (upval)
		return (CreateLazyComponentModule(p2))
	end
	
	local UIBlox = {
		Core = StrictModule({
			Layout = StrictModule({
				Responsive = StrictModule({
					ResponsiveLayoutProvider = require(script.Core.Layout.Responsive.ResponsiveLayoutProvider),
					useResponsiveLayout = require(script.Core.Layout.Responsive.useResponsiveLayout)
				}),
				Grid = StrictModule({
					withGridConfig_DEPRECATED = require(script.Core.Layout.Grid.withGridConfig_DEPRECATED)
				}),
				LayerCollector = StrictModule({
					LayerCollectorProvider = require(script.Core.Layout.LayerCollector.LayerCollectorProvider),
					useLayerCollector = require(script.Core.Layout.LayerCollector.useLayerCollector)
				})
			}),
			Animation = StrictModule({
				withAnimation = require(script.Core.Animation.withAnimation)
			}),
			ImageSet = StrictModule({
				ImageSetButton = require(script.Core.ImageSet.ImageSetComponent).Button,
				ImageSetLabel = require(script.Core.ImageSet.ImageSetComponent).Label,
				Validator = StrictModule({
					validateImage = require(script.Core.ImageSet.Validator.validateImage)
				})
			}),
			Control = StrictModule({
				Enum = StrictModule({ ControlState = ControlStateModule }),
				Interactable = CreateLazyComponentModule(function()
					return require(script.Core.Control.Interactable)
				end),
				StateLayer = CreateLazyComponentModule(function()
					return require(script.Core.Control.StateLayer)
				end),
				FeedbackManagerInjectionContext = require(script.Core.Control.FeedbackManagerInjectionContext)
			}),
			Style = StrictModule({
				Provider = require(script.Core.Style.StyleProvider),
				withStyle = require(script.Core.Style.withStyle),
				useStyle = require(script.Core.Style.useStyle),
				useTextSizeOffset = require(script.Core.Style.useTextSizeOffset),
				withTextSizeOffset = require(script.Core.Style.withTextSizeOffset),
				useStyleMetadata = require(script.Core.Style.useStyleMetadata)
			}),
			VR = StrictModule({
				Panel3D = CreateLazyComponentModule(function()
					return require(script.Core.VR.Panel3D)
				end),
				Constants = require(script.Core.VR.Constants),
				PointerOverlay = CreateLazyComponentModule(function()
					return require(script.Core.VR.PointerOverlay)
				end)
			}),
			Text = StrictModule({
				ExpandableText = StrictModule({
					GetCanExpand = require(script.Core.Text.ExpandableText.ExpandableTextUtils).getCanExpand
				}),
				GetTextSize = require(script.Core.Text.GetTextSize),
				EmojiTextLabel = CreateLazyComponentModule(function()
					return require(script.Core.Text.EmojiTextLabel.EmojiTextLabel)
				end)
			}),
			Enums = StrictModule({ InputType = require(script.Enums.InputType) })
		}),
		Common = StrictModule({
			Style = StrictModule({ ColorSystem = require(script.Common.Style.ColorSystem) })
		}),
		App = StrictModule({
			Context = StrictModule({
				ContentProvider = require(script.App.Context.ContentProvider)
			}),
			ImageSet = StrictModule({
				Images = require(script.App.ImageSet.Images),
				getIconSize = require(script.App.ImageSet.getIconSize),
				getIconSizeUDim2 = require(script.App.ImageSet.getIconSizeUDim2),
				Enum = StrictModule({ IconSize = require(script.App.ImageSet.Enum.IconSize) })
			}),
			Bar = StrictModule({
				HeaderBar = CreateLazyComponentModule(function()
					return require(script.App.Bar.HeaderBar)
				end),
				FullscreenTitleBar = CreateLazyComponentModule(function()
					return require(script.App.Bar.FullscreenTitleBar)
				end),
				ControllerBar = CreateLazyComponentModule(function()
					return require(script.App.Bar.ControllerBar)
				end)
			}),
			Button = StrictModule({
				Enum = StrictModule({
					ButtonType = require(script.App.Button.Enum.ButtonType),
					StandardButtonSize = require(script.Core.Button.Enum.StandardButtonSize)
				}),
				Button = CreateLazyComponentModule(function()
					return require(script.App.Button.Button)
				end),
				ButtonStack = CreateLazyComponentModule(function()
					return require(script.App.Button.ButtonStack)
				end),
				TextButton = CreateLazyComponentModule(function()
					return require(script.App.Button.TextButton)
				end),
				LinkButton = CreateLazyComponentModule(function()
					return require(script.App.Button.LinkButton)
				end),
				IconButton = CreateLazyComponentModule(function()
					return require(script.App.Button.IconButton)
				end),
				ActionBar = CreateLazyComponentModule(function()
					return require(script.App.Button.ActionBar)
				end),
				UtilityActionIcon = CreateLazyComponentModule(function()
					return require(script.App.Button.UtilityActionIcon)
				end),
				ComboButton = CreateLazyComponentModule(function()
					return require(script.App.Button.ComboButton)
				end)
			}),
			Cell = StrictModule({
				Small = StrictModule({
					SelectionGroup = StrictModule({
						SmallRadioButtonGroup = CreateLazyComponentModule(function()
							return require(script.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup)
						end)
					})
				})
			}),
			Text = StrictModule({
				ExpandableTextArea = CreateLazyComponentModule(function()
					return require(script.App.Text.ExpandableTextArea.ExpandableTextArea)
				end),
				StyledTextLabel = CreateLazyComponentModule(function()
					return require(script.App.Text.StyledTextLabel)
				end)
			}),
			Loading = StrictModule({
				Enum = StrictModule({
					RetrievalStatus = require(script.App.Loading.Enum.RetrievalStatus),
					LoadingStrategy = require(script.App.Loading.Enum.LoadingStrategy)
				}),
				LoadableImage = CreateLazyComponentModule(function()
					return require(script.App.Loading.LoadableImage)
				end)
			}),
			InputButton = StrictModule({
				RadioButtonList = CreateLazyComponentModule(function()
					return require(script.App.InputButton.RadioButtonList)
				end)
			}),
			Container = StrictModule({
				Enum = StrictModule({
					ScrollBarType = require(script.App.Container.Enum.ScrollBarType)
				}),
				Carousel = StrictModule({
					FreeFlowCarousel = CreateLazyComponentModule(function()
						return require(script.App.Container.Carousel.FreeFlowCarousel)
					end)
				}),
				Grid = StrictModule({
					ResponsiveGrid = CreateLazyComponentModule(function()
						return require(script.App.Container.Grid.ResponsiveGrid)
					end)
				}),
				VerticalScrollView = CreateLazyComponentModule(function()
					return require(script.App.Container.VerticalScrollView)
				end),
				VerticalScrollViewWithMargin = require(script.App.Container.VerticalScrollViewWithMargin),
				getPageMargin = require(script.App.Container.getPageMargin),
				LoadingStateContainer = CreateLazyComponentModule(function()
					return require(script.App.Container.LoadingStateContainer)
				end),
				LoadingStatePage = CreateLazyComponentModule(function()
					return require(script.App.Container.LoadingStatePage)
				end),
				HorizontalPageMargin = CreateLazyComponentModule(function()
					return require(script.App.Container.HorizontalPageMargin)
				end)
			}),
			Slider = StrictModule({
				ContextualSlider = CreateLazyComponentModule(function()
					return require(script.App.Slider.ContextualSlider)
				end),
				SystemSlider = CreateLazyComponentModule(function()
					return require(script.App.Slider.SystemSlider)
				end)
			}),
			Emoji = StrictModule({
				Enum = StrictModule({ Emoji = require(script.Core.Emoji.Enum.Emoji) })
			}),
			Grid = StrictModule({
				GridView = CreateLazyComponentModule(function()
					return require(script.App.Grid.GridView)
				end),
				GridMetrics = require(script.App.Grid.GridMetrics),
				DefaultMetricsGridView = CreateLazyComponentModule(function()
					return require(script.App.Grid.DefaultMetricsGridView)
				end)
			}),
			Tile = StrictModule({
				MenuTile = CreateLazyComponentModule(function()
					return require(script.App.Tile.MenuTile.MenuTile)
				end),
				PlayerTile = CreateLazyComponentModule(function()
					return require(script.App.Tile.PlayerTile.PlayerTile)
				end),
				ExperienceTileV3 = CreateLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceTileV3)
				end),
				AspectRatioModeEnum = require(script.App.Tile.SplitTile.ExperienceTile.Enum.AspectRatioMode),
				getExperienceTileRelativeHeight = require(script.App.Tile.SplitTile.ExperienceTile.getExperienceTileRelativeHeight),
				ExperienceActionRow = CreateLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceActionRow)
				end),
				VerticalTile = CreateLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.VerticalTile.VerticalTile)
				end),
				VerticalTileThumbnail = CreateLazyComponentModule(function()
					return require(script.App.Tile.SplitTile.VerticalTile.VerticalTileThumbnail)
				end),
				ExperienceTileMetadata = StrictModule({
					SocialProofFooter = CreateLazyComponentModule(function()
						return require(script.App.Tile.ExperienceTileMetadata.SocialProofFooter)
					end),
					CoPlayFooter = CreateLazyComponentModule(function()
						return require(script.App.Tile.ExperienceTileMetadata.CoPlayFooter)
					end),
					TextFooter = CreateLazyComponentModule(function()
						return require(script.App.Tile.ExperienceTileMetadata.TextFooter)
					end)
				})
			}),
			Dialog = StrictModule({
				Modal = StrictModule({
					FullPageModal = CreateLazyComponentModule(function()
						return require(script.App.Dialog.Modal.FullPageModal)
					end),
					getPartialPageModalMiddleContentWidth = require(script.App.Dialog.Modal.getPartialPageModalMiddleContentWidth),
					PartialPageModal = CreateLazyComponentModule(function()
						return require(script.App.Dialog.Modal.PartialPageModal)
					end),
					EducationalModal = CreateLazyComponentModule(function()
						return require(script.App.Dialog.Modal.EducationalModal)
					end),
					ModalWindow = CreateLazyComponentModule(function()
						return require(script.App.Dialog.Modal.ModalWindow)
					end)
				}),
				Alert = StrictModule({
					InteractiveAlert = CreateLazyComponentModule(function()
						return require(script.App.Dialog.Alert.InteractiveAlert)
					end),
					LoadingAlert = CreateLazyComponentModule(function()
						return require(script.App.Dialog.Alert.LoadingAlert)
					end)
				}),
				Enum = StrictModule({
					CloseButtonIcon = require(script.App.Dialog.Modal.Enum.CloseButtonIcon),
					TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation)
				}),
				Toast = CreateLazyComponentModule(function()
					return require(script.App.Dialog.Toast.Toast)
				end),
				Tooltip = CreateLazyComponentModule(function()
					return require(script.App.Dialog.Tooltip.Tooltip)
				end),
				TooltipV2 = require(script.App.Dialog.TooltipV2.Controllers),
				TooltipCallout = CreateLazyComponentModule(function()
					return require(script.App.Dialog.TooltipV2.TooltipCallout)
				end),
				TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation),
				Overlay = OverlayModule
			}),
			Constant = StrictModule({ IconSize = require(script.App.Constant.IconSize) }),
			Style = StrictModule({
				AppStyleProvider = require(script.App.Style.AppStyleProvider),
				Colors = require(script.App.Style.Colors),
				Constants = require(script.App.Style.Constants),
				Themes = {
					DarkTheme = require(script.App.Style.Themes.DarkTheme),
					LightTheme = require(script.App.Style.Themes.LightTheme)
				},
				Tokens = require(script.App.Style.Tokens)
			}),
			Indicator = StrictModule({
				Badge = CreateLazyComponentModule(function()
					return require(script.App.Indicator.Badge)
				end),
				EmptyState = CreateLazyComponentModule(function()
					return require(script.App.Indicator.EmptyState)
				end),
				Enum = StrictModule({
					BadgeStates = require(script.App.Indicator.Enum.BadgeStates),
					BadgeVariant = require(script.App.Indicator.Enum.BadgeVariant),
					VoteStates = require(script.App.Indicator.Enum.VoteStates)
				}),
				PlayerContext = require(script.App.Indicator.PlayerContext),
				PlayerCount = CreateLazyComponentModule(function()
					return require(script.App.Indicator.PlayerCount)
				end),
				RateCount = CreateLazyComponentModule(function()
					return require(script.App.Indicator.RateCount)
				end),
				StatWidget = CreateLazyComponentModule(function()
					return require(script.App.Indicator.StatWidget)
				end),
				StatGroup = CreateLazyComponentModule(function()
					return require(script.App.Indicator.StatGroup)
				end),
				PlayerName = CreateLazyComponentModule(function()
					return require(script.App.Indicator.PlayerName)
				end)
			}),
			Menu = StrictModule({
				BaseMenu = CreateLazyComponentModule(function()
					return require(script.App.Menu.BaseMenu)
				end),
				ContextualMenu = CreateLazyComponentModule(function()
					return require(script.App.Menu.ContextualMenu)
				end),
				MenuDirection = require(script.App.Menu.MenuDirection),
				DropdownMenu = CreateLazyComponentModule(function()
					return require(script.App.Menu.DropdownMenu)
				end),
				KeyLabel = CreateLazyComponentModule(function()
					return require(script.App.Menu.KeyLabel.KeyLabel)
				end),
				KeyLabelUtilities = require(script.App.Menu.KeyLabel.Utilities)
			}),
			Control = StrictModule({
				SegmentedControl = CreateLazyComponentModule(function()
					return require(script.App.Control.SegmentedControl)
				end),
				Pill = CreateLazyComponentModule(function()
					return require(script.App.Control.Pill.Pill)
				end),
				Pillv2 = CreateLazyComponentModule(function()
					return require(script.App.Control.Pill.Pillv2)
				end),
				Slot = StrictModule({
					SlotTray = CreateLazyComponentModule(function()
						return require(script.App.Control.Slot.SlotTray)
					end)
				}),
				PillGroup = CreateLazyComponentModule(function()
					return require(script.App.Control.Pill.PillGroup)
				end)
			}),
			Navigation = StrictModule({
				Enum = StrictModule({
					Placement = require(script.App.Navigation.Enum.Placement),
					NavigationBarAlignment = require(script.App.Navigation.Enum.NavigationBarAlignment),
					NavigationRailAlignment = require(script.App.Navigation.Enum.NavigationRailAlignment),
					NavigationTabLayout = require(script.App.Navigation.Enum.NavigationTabLayout)
				}),
				SystemBar = CreateLazyComponentModule(function()
					return require(script.App.Navigation.SystemBar)
				end),
				NavigationBar = CreateLazyComponentModule(function()
					return require(script.App.Navigation.NavigationBar)
				end),
				NavigationRailV2 = CreateLazyComponentModule(function()
					return require(script.App.Navigation.NavigationRailV2)
				end),
				NavigationTab = require(script.App.Navigation.NavigationTab),
				PrimaryNavBar = StrictModule({
					IconTabGroup = CreateLazyComponentModule(function()
						return require(script.App.Navigation.PrimaryNavBar.IconTabGroup)
					end)
				}),
				ShortcutBar = CreateLazyComponentModule(function()
					return require(script.App.Navigation.ShortcutBar.ShortcutBar)
				end),
				Shortcut = CreateLazyComponentModule(function()
					return require(script.App.Navigation.ShortcutBar.Shortcut)
				end)
			}),
			SelectionImage = StrictModule({
				SelectionCursorProvider = require(script.App.SelectionImage.SelectionCursorProvider),
				CursorKind = require(script.App.SelectionImage.CursorKind),
				withSelectionCursorProvider = require(script.App.SelectionImage.withSelectionCursorProvider),
				useSelectionCursor = require(script.App.SelectionImage.useSelectionCursor)
			}),
			SelectionCursor = StrictModule({
				CursorProvider = require(script.App.SelectionCursor.CursorProvider),
				useCursor = require(script.App.SelectionCursor.useCursor),
				useCursorByType = require(script.App.SelectionCursor.useCursorByType),
				CursorType = require(script.App.SelectionCursor.CursorType)
			}),
			Table = StrictModule({
				ListTable = CreateLazyComponentModule(function()
					return require(script.App.Table.ListTable)
				end),
				ScrollingListTable = CreateLazyComponentModule(function()
					return require(script.App.Table.ScrollingListTable)
				end),
				Cell = CreateLazyComponentModule(function()
					return require(script.App.Table.Cell)
				end),
				CellHeadDetail = CreateLazyComponentModule(function()
					return require(script.App.Table.CellHeadDetail)
				end),
				CellTailDescription = CreateLazyComponentModule(function()
					return require(script.App.Table.CellTailDescription)
				end)
			}),
			Input = StrictModule({
				TextField = CreateLazyComponentModule(function()
					return require(script.App.Input.TextField)
				end)
			})
		}),
		UnitTestHelpers = {
			MockContentProvider = require(script.UnitTestHelpers.MockContentProvider)
		}
	}
	UIBlox.Style = {
		Provider = UIBlox.Core.Style.Provider,
		withStyle = UIBlox.Core.Style.withStyle,
		Validator = {
			validateStyle = require(script.App.Style.Validator.validateStyle),
			validateFontInfo = require(script.Core.Style.Validator.validateFontInfo),
			validateTypographyInfo = require(script.Core.Style.Validator.validateTypographyInfo),
			validateColorInfo = require(script.Core.Style.Validator.validateColorInfo)
		},
		Context = require(script.Core.Style.StyleContext)
	}
	UIBlox.AccordionView = CreateLazyComponentModule(function()
		return require(script.App.Accordion.AccordionView)
	end)
	UIBlox.Tile = {
		SaveTile = CreateLazyComponentModule(function()
			return require(script.App.Tile.SaveTile.SaveTile)
		end),
		ItemTile = CreateLazyComponentModule(function()
			return require(script.App.Tile.ItemTile.ItemTile)
		end),
		ItemTileEnums = require(script.App.Tile.Enum.ItemTileEnums)
	}
	UIBlox.Utility = {
		SpringAnimatedItem = require(script.Utility.SpringAnimatedItem),
		OpenTypeSupport = require(script.Utility.OpenTypeSupport)
	}
	UIBlox.ModalBottomSheet = CreateLazyComponentModule(function()
		return require(script.ModalBottomSheet.ModalBottomSheet)
	end)
	
	if _G.__UIBLOX_TRACK_USAGE__ then
		local UsageTrackerModule = require(script.Parent.UsageTracker)
		UIBlox = UsageTrackerModule.trackMemberAccess("UIBlox", UIBlox, UsageTrackerModule.isReactComponent)
	end
	if p1.enableTraceLevelLog then
		require(script.Logger):enableTraceLog()
	end
	return UIBlox
end, "UIBlox", (require(script.UIBloxDefaultConfig))))