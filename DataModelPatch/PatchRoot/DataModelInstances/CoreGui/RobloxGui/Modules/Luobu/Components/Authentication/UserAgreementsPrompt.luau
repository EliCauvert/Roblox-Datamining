local AppStorageService = game:GetService("AppStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local TModule = require(CorePackages.Packages.t)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LinkButton = UIBloxModule.App.Button.LinkButton
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local SetAgreedUserAgreementsModule = require(Modules.Luobu.Actions.SetAgreedUserAgreements)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local UserAgreementsPrompt = RoactModule.PureComponent:extend("UserAgreementsPrompt")
UserAgreementsPrompt.validateProps = TModule.strictInterface({
	agreements = TModule.array(TModule.strictInterface({
		id = TModule.string,
		agreementType = TModule.string,
		clientType = TModule.string,
		displayUrl = TModule.string,
		regulationType = TModule.string
	})),
	context = TModule.optional(TModule.string),
	screenSize = TModule.Vector2,
	closePrompt = TModule.callback,
	setAgreedUserAgreements = TModule.callback,
	navigateDown = TModule.callback,
	showSecondPrompt = TModule.callback,
	shouldShowCameraPermissionInAgreementsPrompt = TModule.boolean,
	guiService = TModule.table
})

function UserAgreementsPrompt.init(p1)
	-- upvalues: AppStorageService (copy), OverlayTypeModule (copy), NotificationTypeModule (copy), RoactModule (copy), LinkButton (copy), AppPageModule (copy), ImageSetLabel (copy), Images (copy)
	function p1.getLocalizationKeys()
		-- upvalues: p1 (copy)
		local config = {
			title = "Luobu.Authentication.UserAgreementsPrompt.Title",
			bodyTextPart1 = "Luobu.Authentication.UserAgreementsPrompt.BodyText.Part1",
			bodyTextPart2 = "Luobu.Authentication.UserAgreementsPrompt.BodyText.Part2",
			permissionDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Description",
			permissionStorageTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Storage.Title",
			permissionStorageDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Storage.Description",
			permissionNetworkTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Network.Title",
			permissionNetworkDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Network.Description",
			permissionCameraTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Camera.Title",
			permissionCameraDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Camera.Description",
			consentButton = "Luobu.Authentication.UserAgreementsPrompt.Button.Consent",
			dissentButton = "Luobu.Authentication.UserAgreementsPrompt.Button.Dissent"
		}
		
		for _, agreement in pairs(p1.props.agreements) do
			config[agreement.agreementType] = "Luobu.Authentication.Login.Label.Agreement." .. agreement.agreementType
		end
		return config
	end
	
	function p1.onConsent()
		-- upvalues: p1 (copy), AppStorageService (upval)
		local ClosePromptFunction: () -> () = p1.props.closePrompt
		local SetAgreedUserAgreementsFunction: (any) -> () = p1.props.setAgreedUserAgreements
		local Ids = {}
		
		for _, agreement in ipairs(p1.props.agreements) do
			table.insert(Ids, agreement.id)
		end
		SetAgreedUserAgreementsFunction(Ids)
		AppStorageService:SetItem("HasAgreedRequiredPermissions", (tostring(true)))
		ClosePromptFunction()
	end
	
	function p1.onDissent(RenderAgreementsListItemsResult)
		-- upvalues: p1 (copy), OverlayTypeModule (upval), NotificationTypeModule (upval)
		if p1.props.context == OverlayTypeModule.UserAgreementsSecondPrompt then
			p1.props.guiService:BroadcastNotification("", NotificationTypeModule.NATIVE_EXIT)
			
			return
		else
			p1.props.showSecondPrompt(p1.props.agreements, RenderAgreementsListItemsResult)
		end
	end
	
	function p1.renderAgreementsListItems(p2)
		-- upvalues: p1 (copy), RoactModule (upval), LinkButton (upval), AppPageModule (upval)
		local NavigateDownFunction = p1.props.navigateDown
		local config = {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		local LayoutOrder = 1
		
		for _, agreement in ipairs(p1.props.agreements) do
			local Title = p2[agreement.agreementType] or agreement.displayUrl
			config[agreement.agreementType] = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = LayoutOrder,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				RoactModule.createElement(LinkButton, {
					fontStyle = "CaptionHeader",
					minPaddingY = 5,
					text = "• " .. Title,
					onActivated = function()
						-- upvalues: NavigateDownFunction (copy), AppPageModule (upval), agreement (copy), Title (copy)
						NavigateDownFunction({
							name = AppPageModule.GenericWebPage,
							detail = agreement.displayUrl,
							extraProps = { title = Title }
						})
					end
				})
			})
			LayoutOrder += 1
		end
		return config
	end
	
	function p1.renderMiddleContent(p3, p4, RenderAgreementsListItemsResult)
		-- upvalues: AppStorageService (upval), p1 (copy), RoactModule (upval), ImageSetLabel (upval), Images (upval)
		local ShouldShowCameraPermissionInAgreementsPrompt = p1.props.shouldShowCameraPermissionInAgreementsPrompt
		local Theme = p4.Theme
		local _Font = p4.Font
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Agreements = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Prefix = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 12)
				}, {
					PrefixText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, 0),
						Text = p3.bodyTextPart1,
						Font = _Font.CaptionHeader.Font,
						TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) })
				}),
				AgreementsList = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY
				}, RenderAgreementsListItemsResult),
				Suffix = RoactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 12)
				}, {
					Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 12) }),
					PrefixText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, 0),
						Text = p3.bodyTextPart2,
						Font = _Font.CaptionHeader.Font,
						TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					})
				})
			}),
			Permissions = AppStorageService:GetItem("HasAgreedRequiredPermissions") ~= tostring(true) and RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Description = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 12),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					DescriptionText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, 0),
						Text = p3.bodyTextPart1,
						Font = _Font.CaptionHeader.Font,
						TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) })
				}),
				Permissions = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					StoragePermission = RoactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Layout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Icon = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Image = Images["icons/menu/memory"],
							Size = UDim2.new(0, 30, 0, 30),
							ScaleType = Enum.ScaleType.Stretch
						}),
						Content = RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -30, 0, 36)
						}, {
							Layout = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Left,
								SortOrder = Enum.SortOrder.LayoutOrder
							}),
							Title = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Size = UDim2.new(1, 0, 0, 12),
								Text = p3.permissionStorageTitle,
								Font = _Font.CaptionHeader.Font,
								TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
								TextColor3 = Theme.TextDefault.Color,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center
							}),
							DescriptionText = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Size = UDim2.new(1, 0, 0, 24),
								Text = p3.permissionStorageDesc,
								Font = _Font.CaptionBody.Font,
								TextSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize,
								TextColor3 = Theme.TextDefault.Color,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center
							}),
							Padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) })
						})
					}),
					NetworkPermission = RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Layout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Icon = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Image = Images["icons/menu/mobile"],
							Size = UDim2.new(0, 30, 0, 30),
							ScaleType = Enum.ScaleType.Stretch
						}),
						Content = RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -30, 0, 36)
						}, {
							Layout = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Left,
								SortOrder = Enum.SortOrder.LayoutOrder
							}),
							Title = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Size = UDim2.new(1, 0, 0, 12),
								Text = p3.permissionNetworkTitle,
								Font = _Font.CaptionHeader.Font,
								TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
								TextColor3 = Theme.TextDefault.Color,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center
							}),
							DescriptionText = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Size = UDim2.new(1, 0, 0, 24),
								Text = p3.permissionNetworkDesc,
								Font = _Font.CaptionBody.Font,
								TextSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize,
								TextColor3 = Theme.TextDefault.Color,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center
							}),
							Padding = ShouldShowCameraPermissionInAgreementsPrompt and RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 12) })
						})
					}),
					CameraPermission = ShouldShowCameraPermissionInAgreementsPrompt and RoactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Layout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Icon = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Image = Images["icons/menu/mobile"],
							Size = UDim2.new(0, 30, 0, 30),
							ScaleType = Enum.ScaleType.Stretch
						}),
						Content = RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -30, 0, 36)
						}, {
							Layout = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Left,
								SortOrder = Enum.SortOrder.LayoutOrder
							}),
							Title = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Size = UDim2.new(1, 0, 0, 12),
								Text = p3.permissionCameraTitle,
								Font = _Font.CaptionHeader.Font,
								TextSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize,
								TextColor3 = Theme.TextDefault.Color,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center
							}),
							DescriptionText = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Size = UDim2.new(1, 0, 0, 24),
								Text = p3.permissionCameraDesc,
								Font = _Font.CaptionBody.Font,
								TextSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize,
								TextColor3 = Theme.TextDefault.Color,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center
							})
						})
					})
				})
			})
		})
	end
end

function UserAgreementsPrompt.render(p2)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local ScreenSize = p2.props.screenSize
	
	return WithStyleFunction(function(p3)
		-- upvalues: WithLocalizationModule (upval), p2 (copy), RoactModule (upval), InteractiveAlert (upval), ButtonType (upval), ScreenSize (copy)
		return WithLocalizationModule(p2.getLocalizationKeys())(function(p4)
			-- upvalues: p2 (upval), RoactModule (upval), InteractiveAlert (upval), p3 (copy), ButtonType (upval), ScreenSize (upval)
			local RenderAgreementsListItemsResult = p2.renderAgreementsListItems(p4)
			
			return RoactModule.createElement(InteractiveAlert, {
				title = p4.title,
				middleContent = function()
					-- upvalues: p2 (upval), p4 (copy), p3 (upval), RenderAgreementsListItemsResult (copy)
					return p2.renderMiddleContent(p4, p3, RenderAgreementsListItemsResult)
				end,
				buttonStackInfo = {
					buttons = {
						{
							props = {
								onActivated = function()
									-- upvalues: p2 (upval), RenderAgreementsListItemsResult (copy)
									p2.onDissent(RenderAgreementsListItemsResult)
								end,
								text = p4.dissentButton
							}
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = { onActivated = p2.onConsent, text = p4.consentButton }
						}
					}
				},
				position = UDim2.fromScale(0.5, 0.5),
				screenSize = ScreenSize
			})
		end)
	end)
end

return RoactServices.connect({ guiService = AppGuiService })((RoactAppPolicy.connect(function(p2, _)
	return {
		shouldShowCameraPermissionInAgreementsPrompt = p2.getShouldShowCameraPermissionInAgreementsPrompt()
	}
end)((RoactRoduxModule.connect(function(p2)
	return { screenSize = p2.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), SetAgreedUserAgreementsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		setAgreedUserAgreements = function(p2)
			-- upvalues: Callback (copy), SetAgreedUserAgreementsModule (upval)
			return Callback(SetAgreedUserAgreementsModule(p2))
		end,
		navigateDown = function(p2)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p2))
				
				return
			else
				Callback(NavigateDownModule(p2))
			end
		end,
		showSecondPrompt = function(Agreements, AgreementsListItems)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(SetCentralOverlayModule(OverlayTypeModule.UserAgreementsSecondPrompt, {
				agreements = Agreements,
				agreementsListItems = AgreementsListItems
			}))
		end
	}
end)(UserAgreementsPrompt)))))