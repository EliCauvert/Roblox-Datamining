local avatarCreationService = game:GetService("AvatarCreationService")
local parent = script:FindFirstAncestor("SelfieQr").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local httpModule = require(parent.Http)
local localizationModule = require(parent.Localization)
local promiseModule = require(parent.Promise)
local QRCodeDisplayModule = require(parent.QRCodeDisplay)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local displayQRCode = QRCodeDisplayModule.DisplayQRCode
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local image = foundationModule.Image
local icon = foundationModule.Icon
local url = httpModule.Url
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local adoptStyleTokens = game:DefineFastFlag("AdoptStyleTokens", false)
local allowQrEnlargeUniversally = game:DefineFastFlag("AllowQrEnlargeUniversally", false)
local consoleCloseAffordanceFix = game:DefineFastFlag("ConsoleCloseAffordanceFix", false)
local enableTimeoutUI = game:DefineFastFlag("EnableTimeoutUI", false)
local selfieQrTimeoutSeconds = game:DefineFastInt("SelfieQrTimeoutSeconds", 120)
local debugAvatarGenerationStaticApiKey = game:DefineFastString("DebugAvatarGenerationStaticApiKey", "NOT_SET")
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack
}

local function SelfieQRCodeView(p0)
	-- upvalues: useTokens (ref), reactModule (ref), enableTimeoutUI (ref), adoptStyleTokens (ref), displayQRCode (ref), QRCodeDisplayModule (ref), image (ref)
	local var19 = useTokens()
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = true,
		Size = p0.outerSize,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = if enableTimeoutUI and p0.errorOccurred then var19.Color.Extended.Gray.Gray_1000.Color3 elseif adoptStyleTokens then var19.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255)
	}, {
		QRContainer = if enableTimeoutUI and p0.errorOccurred then nil else reactModule.createElement("Frame", {
			Size = UDim2.fromOffset(p0.sideLength, p0.sideLength),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = if adoptStyleTokens then var19.Color.None.Transparency else 1
		}, {
			DisplayQRCode = reactModule.createElement(displayQRCode, {
				toEncode = p0.url,
				ecLevel = QRCodeDisplayModule.ECLevels.EC_LEVEL_4,
				sideLength = p0.sideLength
			})
		}),
		LogoContainer = if enableTimeoutUI and p0.errorOccurred then nil else reactModule.createElement("Frame", {
			ZIndex = 10,
			ClipsDescendants = true,
			Size = UDim2.new(0.3, 0, 0.3, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = if adoptStyleTokens then var19.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.125, 0) }),
			Stroke = reactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = var19.Color.Extended.White.White_0.Color3,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				LineJoinMode = Enum.LineJoinMode.Round
			}),
			Icon = reactModule.createElement(image, {
				ZIndex = 11,
				Size = if adoptStyleTokens then UDim2.fromScale(1, 1) else UDim2.new(0.75, 0, 0.75, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = if adoptStyleTokens then nil else 1,
				Image = if adoptStyleTokens then "rbxasset://textures/ui/LuaApp/ExternalSite/roblox@3x.png" else "icons/logo/block"
			})
		}),
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.065, 0) }),
		Constraint = reactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		})
	})
end

local function getJobStatus(p1, p2)
	-- upvalues: debugAvatarGenerationStaticApiKey (ref), promiseModule (ref)
	return p1(p2, "GET", {
		headers = { ["X-Static-Api-Key"] = debugAvatarGenerationStaticApiKey }
	}):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		local responseBody = p3.responseBody
		
		return responseBody or promiseModule.reject("Invalid response from getJobStatus")
	end)
end

return function(p4)
	-- upvalues: reactModule (ref), responsiveModule (ref), useRoactService (ref), roactNetworking (ref), useTokens (ref), useLocalization (ref), selfieQrTimeoutSeconds (ref), enableTimeoutUI (ref), avatarCreationService (ref), getJobStatus (ref), url (ref), dialogSize (ref), consoleCloseAffordanceFix (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), adoptStyleTokens (ref), allowQrEnlargeUniversally (ref), SelfieQRCodeView (ref), dialog (ref), icon (ref), foundationModule (ref)
	local var20, var21 = reactModule.useState(false)
	local var22 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var23, var24 = reactModule.useState(false)
	local var25, var26 = reactModule.useState(false)
	local var27 = useRoactService(roactNetworking)
	local var28 = useTokens()
	local var29 = useLocalization({
		title = {
			"AvatarGeneration.SelfieConsent.QRTitle",
			fontStart = "<font weight=\"heavy\" size=\"24\">",
			fontEnd = "</font>"
		},
		body = {
			"AvatarGeneration.SelfieConsent.QRBody",
			fontStart = "<font size=\"18\">",
			fontEnd = "</font>"
		},
		errorTitle = {
			"AvatarGeneration.SelfieConsent.QRErrorTitle",
			fontStart = "<font weight=\"heavy\" size=\"24\">",
			fontEnd = "</font>"
		},
		errorBody = {
			"AvatarGeneration.SelfieConsent.QRErrorBody",
			fontStart = "<font size=\"18\">",
			fontEnd = "</font>"
		}
	})
	
	local function _()
		-- upvalues: var26 (ref), var21 (ref), var24 (ref)
		var26(true)
		var21(false)
		var24(false)
	end
	
	reactModule.useEffect(function()
		-- upvalues: selfieQrTimeoutSeconds (copy), enableTimeoutUI (copy), var26 (ref), var21 (ref), var24 (ref), p4 (ref), avatarCreationService (copy), getJobStatus (copy), var27 (ref), url (copy)
		local var32 = nil
		local delayedThread = task.delay(selfieQrTimeoutSeconds, function()
			-- upvalues: enableTimeoutUI (copy), var26 (copy), var21 (copy), var24 (copy), p4 (copy), avatarCreationService (copy)
			if enableTimeoutUI then
				var26(true)
				var21(false)
				var24(false)
				
				return
			end
			p4.displaySelfieQRCode(false)
			avatarCreationService:HandleSelfieQRResult(false, "job not completed within time limit")
		end)
		
		local function poll(p5)
			-- upvalues: getJobStatus (copy), var27 (copy), p4 (copy), avatarCreationService (copy), enableTimeoutUI (copy), var26 (copy), var21 (copy), var24 (copy), var32 (write), poll (ref)
			getJobStatus(var27, p5):andThen(function(p6)
				-- upvalues: p4 (copy), avatarCreationService (copy), enableTimeoutUI (copy), var26 (copy), var21 (copy), var24 (copy), var32 (copy), poll (copy), p5 (ref)
				if p6.status == "done" then
					local var35 = p6.fileIds and p6.fileIds[1]
					p4.displaySelfieQRCode(false)
					avatarCreationService:HandleSelfieQRResult(true, var35)
					
					return
				elseif p6.status ~= "cancelled" and p6.status ~= "error" then
					var32 = task.delay(1, function()
						-- upvalues: poll (copy), p5 (copy)
						poll(p5)
					end)
					
					return
				elseif enableTimeoutUI then
					var26(true)
					var21(false)
					var24(false)
					
					return
				end
				p4.displaySelfieQRCode(false)
				avatarCreationService:HandleSelfieQRResult(false, "job polling failed")
			end):catch(function(_)
				-- upvalues: enableTimeoutUI (copy), var26 (copy), var21 (copy), var24 (copy), p4 (copy), avatarCreationService (copy)
				if enableTimeoutUI then
					var26(true)
					var21(false)
					var24(false)
					
					return
				end
				p4.displaySelfieQRCode(false)
				avatarCreationService:HandleSelfieQRResult(false, "job polling failed")
			end)
		end
		
		poll(string.format("%sml-runtime-gateway/v0.2/jobs/%s", url.APIS_URL, p4.jobId))
		
		return function()
			-- upvalues: var32 (write), delayedThread (ref)
			if var32 then
				task.cancel(var32)
			end
			if delayedThread then
				task.cancel(delayedThread)
			end
		end
	end, {})
	local t_1 = { ZIndex = 2, size = dialogSize.Medium }
	
	if not var22 then
		function t_1.onClose(_)
			-- upvalues: p4 (ref), enableTimeoutUI (copy), avatarCreationService (copy)
			p4.displaySelfieQRCode(false)
			
			if enableTimeoutUI then
				avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed or session expired")
				
				return
			end
			avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
		end
	end
	local var31 = if consoleCloseAffordanceFix then reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(function(p7)
		-- upvalues: var20 (ref), var21 (ref), p4 (ref), enableTimeoutUI (copy), avatarCreationService (copy)
		local eventData = p7.eventData
		
		if eventData and eventData.UserInputState == Enum.UserInputState.End then
			p7:cancel()
			
			if var20 then
				var21(false)
				
				return
			end
			p4.displaySelfieQRCode(false)
			
			if enableTimeoutUI then
				avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed or session expired")
				
				return
			end
			avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
		end
	end, { var20, p4.displaySelfieQRCode }), nil, if consoleCloseAffordanceFix then reactFocusNavigationModule.useEventMap(t) else nil) else nil
	
	return if var20 then reactModule.createElement("Frame", {
		ZIndex = 7,
		ref = if consoleCloseAffordanceFix then var31 else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if adoptStyleTokens then var28.Color.Extended.Black.Black_60.Color3 else Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = if adoptStyleTokens then var28.Color.Extended.Black.Black_60.Transparency else 0.4
	}, {
		InvisibleCloseButton = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if adoptStyleTokens then var28.Color.ActionUtility.Background.Transparency else 1,
			Text = "",
			ZIndex = if not consoleCloseAffordanceFix then 5 else nil,
			[reactModule.Event.Activated] = if allowQrEnlargeUniversally and not var22 or not consoleCloseAffordanceFix then function()
				-- upvalues: var21 (ref)
				var21(false)
			end else nil
		}),
		QRCodeArea = reactModule.createElement(SelfieQRCodeView, {
			sideLength = 500,
			url = p4.url,
			outerSize = UDim2.fromOffset(600, 600),
			errorOccurred = if enableTimeoutUI then var25 else nil
		})
	}) else reactModule.createElement("Frame", {
		ZIndex = 0,
		ref = if consoleCloseAffordanceFix then var31 else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if adoptStyleTokens then var28.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = if adoptStyleTokens then var28.Color.None.Transparency else 1
	}, {
		InvisibleCloseButton = if not consoleCloseAffordanceFix then reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if adoptStyleTokens then var28.Color.ActionUtility.Background.Transparency else 1,
			Text = "",
			ZIndex = 1,
			[reactModule.Event.Activated] = function()
				-- upvalues: p4 (ref), avatarCreationService (copy)
				p4.displaySelfieQRCode(false)
				avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
			end
		}) else nil,
		Dialog = reactModule.createElement(dialog.Root, t_1, {
			DialogContent = reactModule.createElement(dialog.Content, nil, {
				Layout = reactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = if adoptStyleTokens then UDim.new(0, var28.Padding.Small) else UDim.new(0, 10)
				}),
				TopSpacer = reactModule.createElement("Frame", {
					LayoutOrder = 0,
					Size = if adoptStyleTokens then UDim2.fromOffset(0, 56) else UDim2.new(0, 0, 0, 50),
					BackgroundTransparency = if adoptStyleTokens then var28.Color.None.Transparency else 1
				}),
				HoverFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					InteractiveArea = reactModule.createElement("TextButton", {
						Text = "",
						Size = UDim2.new(0.65, 0, 0, 0),
						BackgroundTransparency = if adoptStyleTokens then var28.Color.ActionUtility.Background.Transparency else 1,
						AutoButtonColor = false,
						[reactModule.Event.MouseEnter] = function()
							-- upvalues: enableTimeoutUI (copy), var25 (ref), allowQrEnlargeUniversally (copy), var22 (ref), var24 (ref)
							if enableTimeoutUI and var25 then return end
							if allowQrEnlargeUniversally or var22 then
								var24(true)
							end
						end,
						[reactModule.Event.MouseLeave] = function()
							-- upvalues: var24 (ref)
							var24(false)
						end,
						[reactModule.Event.Activated] = function()
							-- upvalues: enableTimeoutUI (copy), var25 (ref), allowQrEnlargeUniversally (copy), var22 (ref), var21 (ref), var24 (ref)
							if enableTimeoutUI and var25 then return end
							if allowQrEnlargeUniversally or var22 then
								var21(true)
								
								if enableTimeoutUI then
									var24(false)
								end
							end
						end
					}, {
						Constraint = reactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1,
							AspectType = Enum.AspectType.ScaleWithParentSize,
							DominantAxis = Enum.DominantAxis.Width
						}),
						BorderFrame = reactModule.createElement("Frame", {
							Size = UDim2.new(0.98, 0, 0.98, 0),
							Position = UDim2.fromScale(0.5, 0.5),
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundTransparency = var28.Color.ActionEmphasis.Border.Transparency
						}, {
							Stroke = reactModule.createElement("UIStroke", {
								Thickness = 3,
								Color = if adoptStyleTokens then var28.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255),
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								LineJoinMode = Enum.LineJoinMode.Round,
								Transparency = if adoptStyleTokens then if var23 then var28.Color.ActionEmphasis.Foreground.Transparency else var28.Color.ActionEmphasis.Border.Transparency elseif var23 then 0 else 1
							}),
							Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.075, 0) })
						}),
						QRCodeArea = reactModule.createElement(SelfieQRCodeView, {
							sideLength = 225,
							url = p4.url,
							outerSize = UDim2.new(0.95, 0, 0.95, 0),
							errorOccurred = if enableTimeoutUI then var25 else nil
						})
					})
				}),
				BottomSpacer = reactModule.createElement("Frame", {
					LayoutOrder = 2,
					Size = if adoptStyleTokens then UDim2.fromOffset(0, var28.Gap.XXLarge) else UDim2.new(0, 0, 0, 30),
					BackgroundTransparency = if adoptStyleTokens then var28.Color.None.Transparency else 1
				}),
				TextContainerWrapper = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var28.Size.Size_2000),
					BackgroundTransparency = var28.Color.None.Transparency
				}, {
					Layout = if not enableTimeoutUI then reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}) else nil,
					TextAndIconContainer = if enableTimeoutUI then reactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = var28.Color.None.Transparency
					}, {
						Layout = reactModule.createElement("UIListLayout", {
							FillDirection = if var25 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Top,
							Padding = UDim.new(0, var28.Gap.Medium)
						}),
						WarningIcon = if var25 then reactModule.createElement(icon, {
							LayoutOrder = 1,
							name = foundationModule.Enums.IconName.TriangleExclamation,
							size = var28.Size.Size_700,
							BackgroundTransparency = var28.Color.None.Transparency
						}) else nil,
						TextContent = reactModule.createElement("Frame", {
							LayoutOrder = 2,
							Size = if var25 then UDim2.new(1, -48, 0, 0) else UDim2.fromScale(1, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundTransparency = var28.Color.None.Transparency
						}, {
							Layout = reactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								HorizontalAlignment = Enum.HorizontalAlignment.Left,
								Padding = UDim.new(0, var28.Gap.Small)
							}),
							TitleText = reactModule.createElement(dialog.Text, {
								LayoutOrder = 3,
								Text = if var25 then var29.errorTitle else var29.title,
								TextXAlignment = if var25 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
								Font = Enum.Font.SourceSansBold
							}),
							DialogText = reactModule.createElement(dialog.Text, {
								LayoutOrder = 4,
								Text = if var25 then var29.errorBody else "",
								TextXAlignment = Enum.TextXAlignment.Left
							})
						})
					}) else nil,
					TitleText = if not enableTimeoutUI then reactModule.createElement(dialog.Text, {
						LayoutOrder = 3,
						Text = var29.title,
						Font = Enum.Font.SourceSansBold
					}) else nil,
					DialogText = if not enableTimeoutUI then reactModule.createElement(dialog.Text, { LayoutOrder = 4, Text = var29.body }) else nil
				})
			})
		})
	})
end