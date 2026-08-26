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

local function SelfieQRCodeView(p1)
	-- upvalues: useTokens (ref), reactModule (ref), enableTimeoutUI (ref), adoptStyleTokens (ref), displayQRCode (ref), QRCodeDisplayModule (ref), image (ref)
	local var1 = useTokens()
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = true,
		Size = p1.outerSize,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = if enableTimeoutUI and p1.errorOccurred then var1.Color.Extended.Gray.Gray_1000.Color3 elseif adoptStyleTokens then var1.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255)
	}, {
		QRContainer = if enableTimeoutUI and p1.errorOccurred then nil else reactModule.createElement("Frame", {
			Size = UDim2.fromOffset(p1.sideLength, p1.sideLength),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = if adoptStyleTokens then var1.Color.None.Transparency else 1
		}, {
			DisplayQRCode = reactModule.createElement(displayQRCode, {
				toEncode = p1.url,
				ecLevel = QRCodeDisplayModule.ECLevels.EC_LEVEL_4,
				sideLength = p1.sideLength
			})
		}),
		LogoContainer = if enableTimeoutUI and p1.errorOccurred then nil else reactModule.createElement("Frame", {
			ZIndex = 10,
			ClipsDescendants = true,
			Size = UDim2.new(0.3, 0, 0.3, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = if adoptStyleTokens then var1.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.125, 0) }),
			Stroke = reactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = var1.Color.Extended.White.White_0.Color3,
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

return function(p1)
	-- upvalues: reactModule (ref), responsiveModule (ref), useRoactService (ref), roactNetworking (ref), useTokens (ref), useLocalization (ref), selfieQrTimeoutSeconds (ref), enableTimeoutUI (ref), avatarCreationService (ref), getJobStatus (ref), url (ref), dialogSize (ref), consoleCloseAffordanceFix (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), adoptStyleTokens (ref), allowQrEnlargeUniversally (ref), SelfieQRCodeView (ref), dialog (ref), icon (ref), foundationModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8 = useRoactService(roactNetworking)
	local var9 = useTokens()
	local var10 = useLocalization({
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
		-- upvalues: var7 (ref), var2 (ref), var5 (ref)
		var7(true)
		var2(false)
		var5(false)
	end
	
	reactModule.useEffect(function()
		-- upvalues: selfieQrTimeoutSeconds (copy), enableTimeoutUI (copy), var7 (ref), var2 (ref), var5 (ref), p1 (ref), avatarCreationService (copy), getJobStatus (copy), var8 (ref), url (copy)
		local var11 = nil
		local delayedThread = task.delay(selfieQrTimeoutSeconds, function()
			-- upvalues: enableTimeoutUI (copy), var7 (copy), var2 (copy), var5 (copy), p1 (copy), avatarCreationService (copy)
			if enableTimeoutUI then
				var7(true)
				var2(false)
				var5(false)
				
				return
			end
			p1.displaySelfieQRCode(false)
			avatarCreationService:HandleSelfieQRResult(false, "job not completed within time limit")
		end)
		
		local function poll(p2)
			-- upvalues: getJobStatus (copy), var8 (copy), p1 (copy), avatarCreationService (copy), enableTimeoutUI (copy), var7 (copy), var2 (copy), var5 (copy), var11 (write), poll (ref)
			getJobStatus(var8, p2):andThen(function(p3)
				-- upvalues: p1 (copy), avatarCreationService (copy), enableTimeoutUI (copy), var7 (copy), var2 (copy), var5 (copy), var11 (copy), poll (copy), p2 (ref)
				if p3.status == "done" then
					local var12 = p3.fileIds and p3.fileIds[1]
					p1.displaySelfieQRCode(false)
					avatarCreationService:HandleSelfieQRResult(true, var12)
					
					return
				elseif p3.status ~= "cancelled" and p3.status ~= "error" then
					var11 = task.delay(1, function()
						-- upvalues: poll (copy), p2 (copy)
						poll(p2)
					end)
					
					return
				elseif enableTimeoutUI then
					var7(true)
					var2(false)
					var5(false)
					
					return
				end
				p1.displaySelfieQRCode(false)
				avatarCreationService:HandleSelfieQRResult(false, "job polling failed")
			end):catch(function(_)
				-- upvalues: enableTimeoutUI (copy), var7 (copy), var2 (copy), var5 (copy), p1 (copy), avatarCreationService (copy)
				if enableTimeoutUI then
					var7(true)
					var2(false)
					var5(false)
					
					return
				end
				p1.displaySelfieQRCode(false)
				avatarCreationService:HandleSelfieQRResult(false, "job polling failed")
			end)
		end
		
		poll(string.format("%sml-runtime-gateway/v0.2/jobs/%s", url.APIS_URL, p1.jobId))
		
		return function()
			-- upvalues: var11 (write), delayedThread (ref)
			if var11 then
				task.cancel(var11)
			end
			if delayedThread then
				task.cancel(delayedThread)
			end
		end
	end, {})
	local t_1 = { ZIndex = 2, size = dialogSize.Medium }
	
	if not var3 then
		function t_1.onClose(_)
			-- upvalues: p1 (ref), enableTimeoutUI (copy), avatarCreationService (copy)
			p1.displaySelfieQRCode(false)
			
			if enableTimeoutUI then
				avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed or session expired")
				
				return
			end
			avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
		end
	end
	local var11 = if consoleCloseAffordanceFix then reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var2 (ref), p1 (ref), enableTimeoutUI (copy), avatarCreationService (copy)
		local eventData = p2.eventData
		
		if eventData and eventData.UserInputState == Enum.UserInputState.End then
			p2:cancel()
			
			if var1 then
				var2(false)
				
				return
			end
			p1.displaySelfieQRCode(false)
			
			if enableTimeoutUI then
				avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed or session expired")
				
				return
			end
			avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
		end
	end, { var1, p1.displaySelfieQRCode }), nil, if consoleCloseAffordanceFix then reactFocusNavigationModule.useEventMap(t) else nil) else nil
	
	return if var1 then reactModule.createElement("Frame", {
		ZIndex = 7,
		ref = if consoleCloseAffordanceFix then var11 else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if adoptStyleTokens then var9.Color.Extended.Black.Black_60.Color3 else Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = if adoptStyleTokens then var9.Color.Extended.Black.Black_60.Transparency else 0.4
	}, {
		InvisibleCloseButton = reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if adoptStyleTokens then var9.Color.ActionUtility.Background.Transparency else 1,
			Text = "",
			ZIndex = if not consoleCloseAffordanceFix then 5 else nil,
			[reactModule.Event.Activated] = if allowQrEnlargeUniversally and not var3 or not consoleCloseAffordanceFix then function()
				-- upvalues: var2 (ref)
				var2(false)
			end else nil
		}),
		QRCodeArea = reactModule.createElement(SelfieQRCodeView, {
			sideLength = 500,
			url = p1.url,
			outerSize = UDim2.fromOffset(600, 600),
			errorOccurred = if enableTimeoutUI then var6 else nil
		})
	}) else reactModule.createElement("Frame", {
		ZIndex = 0,
		ref = if consoleCloseAffordanceFix then var11 else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if adoptStyleTokens then var9.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = if adoptStyleTokens then var9.Color.None.Transparency else 1
	}, {
		InvisibleCloseButton = if not consoleCloseAffordanceFix then reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if adoptStyleTokens then var9.Color.ActionUtility.Background.Transparency else 1,
			Text = "",
			ZIndex = 1,
			[reactModule.Event.Activated] = function()
				-- upvalues: p1 (ref), avatarCreationService (copy)
				p1.displaySelfieQRCode(false)
				avatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
			end
		}) else nil,
		Dialog = reactModule.createElement(dialog.Root, t_1, {
			DialogContent = reactModule.createElement(dialog.Content, nil, {
				Layout = reactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = if adoptStyleTokens then UDim.new(0, var9.Padding.Small) else UDim.new(0, 10)
				}),
				TopSpacer = reactModule.createElement("Frame", {
					LayoutOrder = 0,
					Size = if adoptStyleTokens then UDim2.fromOffset(0, 56) else UDim2.new(0, 0, 0, 50),
					BackgroundTransparency = if adoptStyleTokens then var9.Color.None.Transparency else 1
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
						BackgroundTransparency = if adoptStyleTokens then var9.Color.ActionUtility.Background.Transparency else 1,
						AutoButtonColor = false,
						[reactModule.Event.MouseEnter] = function()
							-- upvalues: enableTimeoutUI (copy), var6 (ref), allowQrEnlargeUniversally (copy), var3 (ref), var5 (ref)
							if enableTimeoutUI and var6 then return end
							if allowQrEnlargeUniversally or var3 then
								var5(true)
							end
						end,
						[reactModule.Event.MouseLeave] = function()
							-- upvalues: var5 (ref)
							var5(false)
						end,
						[reactModule.Event.Activated] = function()
							-- upvalues: enableTimeoutUI (copy), var6 (ref), allowQrEnlargeUniversally (copy), var3 (ref), var2 (ref), var5 (ref)
							if enableTimeoutUI and var6 then return end
							if allowQrEnlargeUniversally or var3 then
								var2(true)
								
								if enableTimeoutUI then
									var5(false)
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
							BackgroundTransparency = var9.Color.ActionEmphasis.Border.Transparency
						}, {
							Stroke = reactModule.createElement("UIStroke", {
								Thickness = 3,
								Color = if adoptStyleTokens then var9.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255),
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								LineJoinMode = Enum.LineJoinMode.Round,
								Transparency = if adoptStyleTokens then if var4 then var9.Color.ActionEmphasis.Foreground.Transparency else var9.Color.ActionEmphasis.Border.Transparency elseif var4 then 0 else 1
							}),
							Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.075, 0) })
						}),
						QRCodeArea = reactModule.createElement(SelfieQRCodeView, {
							sideLength = 225,
							url = p1.url,
							outerSize = UDim2.new(0.95, 0, 0.95, 0),
							errorOccurred = if enableTimeoutUI then var6 else nil
						})
					})
				}),
				BottomSpacer = reactModule.createElement("Frame", {
					LayoutOrder = 2,
					Size = if adoptStyleTokens then UDim2.fromOffset(0, var9.Gap.XXLarge) else UDim2.new(0, 0, 0, 30),
					BackgroundTransparency = if adoptStyleTokens then var9.Color.None.Transparency else 1
				}),
				TextContainerWrapper = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var9.Size.Size_2000),
					BackgroundTransparency = var9.Color.None.Transparency
				}, {
					Layout = if not enableTimeoutUI then reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}) else nil,
					TextAndIconContainer = if enableTimeoutUI then reactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = var9.Color.None.Transparency
					}, {
						Layout = reactModule.createElement("UIListLayout", {
							FillDirection = if var6 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Top,
							Padding = UDim.new(0, var9.Gap.Medium)
						}),
						WarningIcon = if var6 then reactModule.createElement(icon, {
							LayoutOrder = 1,
							name = foundationModule.Enums.IconName.TriangleExclamation,
							size = var9.Size.Size_700,
							BackgroundTransparency = var9.Color.None.Transparency
						}) else nil,
						TextContent = reactModule.createElement("Frame", {
							LayoutOrder = 2,
							Size = if var6 then UDim2.new(1, -48, 0, 0) else UDim2.fromScale(1, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundTransparency = var9.Color.None.Transparency
						}, {
							Layout = reactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								HorizontalAlignment = Enum.HorizontalAlignment.Left,
								Padding = UDim.new(0, var9.Gap.Small)
							}),
							TitleText = reactModule.createElement(dialog.Text, {
								LayoutOrder = 3,
								Text = if var6 then var10.errorTitle else var10.title,
								TextXAlignment = if var6 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
								Font = Enum.Font.SourceSansBold
							}),
							DialogText = reactModule.createElement(dialog.Text, {
								LayoutOrder = 4,
								Text = if var6 then var10.errorBody else "",
								TextXAlignment = Enum.TextXAlignment.Left
							})
						})
					}) else nil,
					TitleText = if not enableTimeoutUI then reactModule.createElement(dialog.Text, {
						LayoutOrder = 3,
						Text = var10.title,
						Font = Enum.Font.SourceSansBold
					}) else nil,
					DialogText = if not enableTimeoutUI then reactModule.createElement(dialog.Text, { LayoutOrder = 4, Text = var10.body }) else nil
				})
			})
		})
	})
end