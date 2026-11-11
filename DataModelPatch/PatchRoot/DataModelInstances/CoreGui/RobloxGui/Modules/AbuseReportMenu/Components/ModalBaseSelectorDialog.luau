local CorePackages = game:GetService("CorePackages")
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local ScrollingListTable = UIBloxModule.App.Table.ScrollingListTable
local CellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local Cell = UIBloxModule.App.Table.Cell
local CellTailDescription = UIBloxModule.App.Table.CellTailDescription
local ModalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local DashModule = require(CorePackages.Packages.Dash)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local Images = UIBloxModule.App.ImageSet.Images
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local GetFFlagModalSelectorCloseButtonModule = require(script:FindFirstAncestor("AbuseReportMenu").Flags.GetFFlagModalSelectorCloseButton)
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local ResponsiveModule = nil
local UIManager = nil
local PanelType = nil

if IsInExperienceUIVREnabled then
	ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
	local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
	UIManager = VrSpatialUiModule.UIManager
	PanelType = VrSpatialUiModule.Constants.PanelType
end
local function ModalBaseSelectorDialog(p1)
	-- upvalues: UseTokensFunction (copy), UseStyleFunction (copy), IsInExperienceUIVREnabled (copy), ResponsiveModule (ref), UIManager (ref), PanelType (ref), ReactModule (copy), GetFFlagModalSelectorCloseButtonModule (copy), CryoModule (copy), IconButton (copy), IconSize (copy), Images (copy), ScrollingListTable (copy), DashModule (copy), Cell (copy), CellHeadDetail (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), CellTailDescription (copy), ModalWindow (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local Size1000 = UseStyleResult.Tokens.Size.Size_1000
	local Smallest: number = if IsInExperienceUIVREnabled then math.min(#p1.cellData * UseTokensResult.Size.Size_1000, (if ResponsiveModule.useIsSpatial() then UIManager.getInstance():getPanelObject(PanelType.MoreMenu).AbsoluteSize.Y else p1.viewportHeight) - 80 - 24) else math.min(#p1.cellData * UseTokensResult.Size.Size_1000, p1.viewportHeight - 80 - 24)
	local YOffset = Smallest + 24
	local Offset = 0
	local YOffset1 = 0
	local JoinResult = {
		Paddings = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12)
		})
	}
	
	if GetFFlagModalSelectorCloseButtonModule() then
		YOffset = Smallest + 48 + Size1000
		Offset = 12
		YOffset1 = -36
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			Layout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = 0,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Header = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, Size1000)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right
				}),
				CloseButton = ReactModule.createElement(IconButton, {
					size = UDim2.fromOffset(0, 0),
					iconSize = IconSize.Medium,
					icon = Images["icons/navigation/close"],
					onActivated = function()
						-- upvalues: p1 (copy)
						p1.onClose()
					end
				})
			}),
			Divider = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
				BackgroundColor3 = UseStyleResult.Theme.Divider.Color
			})
		})
	end
	local JoinResult1 = CryoModule.Dictionary.join(JoinResult, {
		SelectorFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 1, YOffset1)
		}, {
			Paddings = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, Offset) }),
			ModalSelector = ReactModule.createElement(ScrollingListTable, {
				selectable = false,
				size = UDim2.new(1, 0, 1, 0),
				cells = DashModule.map(p1.cellData, function(p2)
					-- upvalues: ReactModule (upval), Cell (upval), CellHeadDetail (upval), GetFFlagLuaAppEnableOpenTypeSupportFunction (upval), OpenTypeSupport (upval), CellTailDescription (upval), UseTokensResult (copy), p1 (copy)
					return ReactModule.createElement(Cell, {
						userInteractionEnabled = true,
						head = ReactModule.createElement(CellHeadDetail, {
							labelText = p2.label,
							subLabelText = p2.subLabel,
							openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
						}),
						tail = ReactModule.createElement(CellTailDescription, { text = "", showArrow = false }),
						background = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }),
						size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
						onActivated = function()
							-- upvalues: p1 (upval), p2 (copy)
							p1.onSelect(p2.label, p2.subLabel, p2.identifier)
							p1.onClose()
						end
					})
				end)
			})
		})
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		Overlay = if p1.isShown then ReactModule.createElement("TextButton", {
			Selectable = false,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = 10,
			Text = "",
			[ReactModule.Event.Activated] = function()
				-- upvalues: p1 (copy)
				p1.onClose()
			end
		}, {
			Modal = ReactModule.createElement(ModalWindow, {
				isFullHeight = false,
				screenSize = Vector2.new(p1.viewportWidth, p1.viewportHeight)
			}, {
				ModalContent = ReactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					Size = UDim2.new(1, 0, 0, YOffset),
					BackgroundColor3 = Theme.BackgroundDefault.Color,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 20)
				}, JoinResult1)
			})
		}) else nil
	})
end

function DialogWrapper(p1)
	-- upvalues: ReactModule (copy), CoreScriptsRootProvider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), ModalBaseSelectorDialog (copy)
	return ReactModule.createElement(CoreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			DialogContainer = ReactModule.createElement(ModalBaseSelectorDialog, p1)
		})
	})
end

return DialogWrapper