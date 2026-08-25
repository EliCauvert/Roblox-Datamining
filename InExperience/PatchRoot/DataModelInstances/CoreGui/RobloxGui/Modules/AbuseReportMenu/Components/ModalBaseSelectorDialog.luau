local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local useTokens = require(corePackagesService.Packages.Foundation).Hooks.useTokens
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local scrollingListTable = UIBloxModule.App.Table.ScrollingListTable
local cellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local cell = UIBloxModule.App.Table.Cell
local cellTailDescription = UIBloxModule.App.Table.CellTailDescription
local modalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local dashModule = require(corePackagesService.Packages.Dash)
local cryoModule = require(corePackagesService.Packages.Cryo)
local useStyle = UIBloxModule.Core.Style.useStyle
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local images = UIBloxModule.App.ImageSet.Images
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local getFFlagModalSelectorCloseButtonModule = require(abuseReportMenu.Flags.GetFFlagModalSelectorCloseButton)
local getFFlagLuaAppEnableOpenTypeSupport = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local responsiveModule = nil
local UIManager = nil
local panelType = nil

if isInExperienceUIVREnabled then
	responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	UIManager = vrSpatialUiModule.UIManager
	panelType = vrSpatialUiModule.Constants.PanelType
end
local function ModalBaseSelectorDialog(p0)
	-- upvalues: useTokens (ref), useStyle (ref), isInExperienceUIVREnabled (ref), responsiveModule (write), UIManager (write), panelType (write), reactModule (ref), getFFlagModalSelectorCloseButtonModule (ref), cryoModule (ref), iconButton (ref), iconSize (ref), images (ref), scrollingListTable (ref), dashModule (ref), cell (ref), cellHeadDetail (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), cellTailDescription (ref), modalWindow (ref)
	local var11 = useTokens()
	local var12 = useStyle()
	local theme = var12.Theme
	local size1000 = var12.Tokens.Size.Size_1000
	local var13 = if isInExperienceUIVREnabled then math.min(#p0.cellData * var11.Size.Size_1000, (if responsiveModule.useIsSpatial() then UIManager.getInstance():getPanelObject(panelType.MoreMenu).AbsoluteSize.Y else p0.viewportHeight) - 80 - 24) else math.min(#p0.cellData * var11.Size.Size_1000, p0.viewportHeight - 80 - 24)
	local var14 = var13 + 24
	local var15 = 0
	local var16 = 0
	local t = {
		Paddings = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12)
		})
	}
	
	if getFFlagModalSelectorCloseButtonModule() then
		var14 = var13 + 48 + size1000
		var15 = 12
		var16 = -36
		t = cryoModule.Dictionary.join(t, {
			Layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = 0,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Header = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, size1000)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right
				}),
				CloseButton = reactModule.createElement(iconButton, {
					size = UDim2.fromOffset(0, 0),
					iconSize = iconSize.Medium,
					icon = images["icons/navigation/close"],
					onActivated = function()
						-- upvalues: p0 (ref)
						p0.onClose()
					end
				})
			}),
			Divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = var12.Theme.Divider.Transparency,
				BackgroundColor3 = var12.Theme.Divider.Color
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		Overlay = if p0.isShown then reactModule.createElement("TextButton", {
			Selectable = false,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundColor3 = theme.Overlay.Color,
			BackgroundTransparency = theme.Overlay.Transparency,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = 10,
			Text = "",
			[reactModule.Event.Activated] = function()
				-- upvalues: p0 (ref)
				p0.onClose()
			end
		}, {
			Modal = reactModule.createElement(modalWindow, {
				isFullHeight = false,
				screenSize = Vector2.new(p0.viewportWidth, p0.viewportHeight)
			}, {
				ModalContent = reactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					Size = UDim2.new(1, 0, 0, var14),
					BackgroundColor3 = theme.BackgroundDefault.Color,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 20)
				}, cryoModule.Dictionary.join(t, {
					SelectorFrame = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 1, var16)
					}, {
						Paddings = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var15) }),
						ModalSelector = reactModule.createElement(scrollingListTable, {
							selectable = false,
							size = UDim2.new(1, 0, 1, 0),
							cells = dashModule.map(p0.cellData, function(p1)
								-- upvalues: reactModule (copy), cell (copy), cellHeadDetail (copy), getFFlagLuaAppEnableOpenTypeSupport (copy), openTypeSupport (copy), cellTailDescription (copy), var11 (ref), p0 (ref)
								return reactModule.createElement(cell, {
									userInteractionEnabled = true,
									head = reactModule.createElement(cellHeadDetail, {
										labelText = p1.label,
										subLabelText = p1.subLabel,
										openTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil
									}),
									tail = reactModule.createElement(cellTailDescription, { text = "", showArrow = false }),
									background = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }),
									size = UDim2.new(1, 0, 0, var11.Size.Size_1000),
									onActivated = function()
										-- upvalues: p0 (copy), p1 (ref)
										p0.onSelect(p1.label, p1.subLabel, p1.identifier)
										p0.onClose()
									end
								})
							end)
						})
					})
				}))
			})
		}) else nil
	})
end

function DialogWrapper(p2)
	-- upvalues: reactModule (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), ModalBaseSelectorDialog (ref)
	return reactModule.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			DialogContainer = reactModule.createElement(ModalBaseSelectorDialog, p2)
		})
	})
end

return DialogWrapper