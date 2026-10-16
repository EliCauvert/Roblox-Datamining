local AvatarCreationService = game:GetService("AvatarCreationService")
local Parent = script:FindFirstAncestor("SelfieQr").Parent
local FoundationModule = require(Parent.Foundation)
local PromiseModule = require(Parent.Promise)
local QRCodeDisplayModule = require(Parent.QRCodeDisplay)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local DisplayQRCode = QRCodeDisplayModule.DisplayQRCode
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Url = require(Parent.Http).Url
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AdoptStyleTokens = game:DefineFastFlag("AdoptStyleTokens", false)
local AllowQrEnlargeUniversally = game:DefineFastFlag("AllowQrEnlargeUniversally", false)
local ConsoleCloseAffordanceFix = game:DefineFastFlag("ConsoleCloseAffordanceFix", false)
local EnableTimeoutUI = game:DefineFastFlag("EnableTimeoutUI", false)
local SelfieQrTimeoutSeconds = game:DefineFastInt("SelfieQrTimeoutSeconds", 120)
local DebugAvatarGenerationStaticApiKey = game:DefineFastString("DebugAvatarGenerationStaticApiKey", "NOT_SET")
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack
}

local function SelfieQRCodeView(p1) --[[ Line: 60 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), EnableTimeoutUI (copy), AdoptStyleTokens (copy), DisplayQRCode (copy), QRCodeDisplayModule (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = true,
		Size = p1.outerSize,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = if EnableTimeoutUI and p1.errorOccurred then UseTokensResult.Color.Extended.Gray.Gray_1000.Color3 elseif AdoptStyleTokens then UseTokensResult.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255)
	}, {
		QRContainer = if EnableTimeoutUI and p1.errorOccurred then nil else ReactModule.createElement("Frame", {
			Size = UDim2.fromOffset(p1.sideLength, p1.sideLength),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.None.Transparency else 1
		}, {
			DisplayQRCode = ReactModule.createElement(DisplayQRCode, {
				toEncode = p1.url,
				ecLevel = QRCodeDisplayModule.ECLevels.EC_LEVEL_4,
				sideLength = p1.sideLength
			})
		}),
		LogoContainer = if EnableTimeoutUI and p1.errorOccurred then nil else ReactModule.createElement("Frame", {
			ZIndex = 10,
			ClipsDescendants = true,
			Size = UDim2.new(0.3, 0, 0.3, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = if AdoptStyleTokens then UseTokensResult.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.125, 0) }),
			Stroke = ReactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = UseTokensResult.Color.Extended.White.White_0.Color3,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				LineJoinMode = Enum.LineJoinMode.Round
			}),
			Icon = ReactModule.createElement(Image, {
				ZIndex = 11,
				Size = if AdoptStyleTokens then UDim2.fromScale(1, 1) else UDim2.new(0.75, 0, 0.75, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = if AdoptStyleTokens then nil else 1,
				Image = if AdoptStyleTokens then "rbxasset://textures/ui/LuaApp/ExternalSite/roblox@3x.png" else "icons/logo/block"
			})
		}),
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.065, 0) }),
		Constraint = ReactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		})
	})
end

local function getJobStatus(Callback, p1) --[[ Line: 133 ]]
	-- upvalues: DebugAvatarGenerationStaticApiKey (copy), PromiseModule (copy)
	return Callback(p1, "GET", {
		headers = { ["X-Static-Api-Key"] = DebugAvatarGenerationStaticApiKey }
	}):andThen(function(Result) --[[ Line: 135 ]]
		-- upvalues: PromiseModule (upval)
		local ResponseBody = Result.responseBody
		
		return if ResponseBody then ResponseBody else PromiseModule.reject("Invalid response from getJobStatus")
	end)
end

return function(p1) --[[ Line: 146 ]]
	-- upvalues: ReactModule (copy), ResponsiveModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), SelfieQrTimeoutSeconds (copy), EnableTimeoutUI (copy), AvatarCreationService (copy), getJobStatus (copy), Url (copy), DialogSize (copy), ConsoleCloseAffordanceFix (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy), AdoptStyleTokens (copy), AllowQrEnlargeUniversally (copy), SelfieQRCodeView (copy), Dialog (copy), Icon (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
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
	
	local function _() --[[ Line: 178 | Named "handleError" ]]
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseStateResult2_2(true)
		UseStateResult2(false)
		UseStateResult2_1(false)
	end
	
	ReactModule.useEffect(function() --[[ Line: 185 ]]
		-- upvalues: SelfieQrTimeoutSeconds (upval), EnableTimeoutUI (upval), UseStateResult2_2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (copy), AvatarCreationService (upval), getJobStatus (upval), UseRoactServiceResult (copy), Url (upval)
		local DelayedThread = nil
		local DelayedThread1 = task.delay(SelfieQrTimeoutSeconds, function() --[[ Line: 187 ]]
			-- upvalues: EnableTimeoutUI (upval), UseStateResult2_2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), p1 (upval), AvatarCreationService (upval)
			if EnableTimeoutUI then
				UseStateResult2_2(true)
				UseStateResult2(false)
				UseStateResult2_1(false)
				
				return
			else
				p1.displaySelfieQRCode(false)
				AvatarCreationService:HandleSelfieQRResult(false, "job not completed within time limit")
			end
		end)
		
		local function poll(Formatted) --[[ Line: 196 ]]
			-- upvalues: getJobStatus (upval), UseRoactServiceResult (upval), p1 (upval), AvatarCreationService (upval), EnableTimeoutUI (upval), UseStateResult2_2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), DelayedThread (ref), poll (copy)
			getJobStatus(UseRoactServiceResult, Formatted):andThen(function(Result) --[[ Line: 198 ]]
				-- upvalues: p1 (upval), AvatarCreationService (upval), EnableTimeoutUI (upval), UseStateResult2_2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), DelayedThread (upval), poll (upval), Formatted (copy)
				if Result.status == "done" then
					local FileId = Result.fileIds and Result.fileIds[1]
					p1.displaySelfieQRCode(false)
					AvatarCreationService:HandleSelfieQRResult(true, FileId)
					
					return
				end
				if Result.status ~= "cancelled" and Result.status ~= "error" then
					DelayedThread = task.delay(1, function() --[[ Line: 211 ]]
						-- upvalues: poll (upval), Formatted (upval)
						poll(Formatted)
					end)
					
					return
				end
				if EnableTimeoutUI then
					UseStateResult2_2(true)
					UseStateResult2(false)
					UseStateResult2_1(false)
					
					return
				else
					p1.displaySelfieQRCode(false)
					AvatarCreationService:HandleSelfieQRResult(false, "job polling failed")
				end
			end):catch(function(_) --[[ Line: 216 ]]
				-- upvalues: EnableTimeoutUI (upval), UseStateResult2_2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), p1 (upval), AvatarCreationService (upval)
				if EnableTimeoutUI then
					UseStateResult2_2(true)
					UseStateResult2(false)
					UseStateResult2_1(false)
					
					return
				else
					p1.displaySelfieQRCode(false)
					AvatarCreationService:HandleSelfieQRResult(false, "job polling failed")
				end
			end)
		end
		
		poll((string.format("%sml-runtime-gateway/v0.2/jobs/%s", Url.APIS_URL, p1.jobId)))
		
		return function() --[[ Line: 229 ]]
			-- upvalues: DelayedThread (ref), DelayedThread1 (copy)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
			if DelayedThread1 then
				task.cancel(DelayedThread1)
			end
		end
	end, {})
	local config1 = { ZIndex = 2, size = DialogSize.Medium }
	
	if not IsUsePreferredInputResultMatch then
		function config1:onClose() --[[ Line: 245 ]]
			-- upvalues: p1 (copy), EnableTimeoutUI (upval), AvatarCreationService (upval)
			p1.displaySelfieQRCode(false)
			
			if EnableTimeoutUI then
				AvatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed or session expired")
				
				return
			else
				AvatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
			end
		end
	end
	local UseEventMapResult = if ConsoleCloseAffordanceFix then ReactFocusNavigationModule.useEventMap(config) else nil
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 259 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), p1 (copy), EnableTimeoutUI (upval), AvatarCreationService (upval)
		local EventData = p2.eventData
		
		if EventData and EventData.UserInputState == Enum.UserInputState.End then
			p2:cancel()
			
			if UseStateResult then
				UseStateResult2(false)
				
				return
			end
			p1.displaySelfieQRCode(false)
			
			if EnableTimeoutUI then
				AvatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed or session expired")
				
				return
			end
			AvatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
		end
	end, { UseStateResult, p1.displaySelfieQRCode })
	local UseEventResult = if ConsoleCloseAffordanceFix then ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, UseResult, nil, UseEventMapResult) else nil
	
	return if UseStateResult then ReactModule.createElement("Frame", {
		ZIndex = 7,
		ref = if ConsoleCloseAffordanceFix then UseEventResult else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if AdoptStyleTokens then UseTokensResult.Color.Extended.Black.Black_60.Color3 else Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.Extended.Black.Black_60.Transparency else 0.4
	}, {
		InvisibleCloseButton = ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.ActionUtility.Background.Transparency else 1,
			Text = "",
			ZIndex = if ConsoleCloseAffordanceFix then nil else 5,
			[ReactModule.Event.Activated] = if AllowQrEnlargeUniversally and not IsUsePreferredInputResultMatch then function() --[[ Line: 311 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end elseif ConsoleCloseAffordanceFix then nil else function() --[[ Line: 311 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}),
		QRCodeArea = ReactModule.createElement(SelfieQRCodeView, {
			sideLength = 500,
			url = p1.url,
			outerSize = UDim2.fromOffset(600, 600),
			errorOccurred = if EnableTimeoutUI then UseStateResult3 else nil
		})
	}) else ReactModule.createElement("Frame", {
		ZIndex = 0,
		ref = if ConsoleCloseAffordanceFix then UseEventResult else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if AdoptStyleTokens then UseTokensResult.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.None.Transparency else 1
	}, {
		InvisibleCloseButton = if ConsoleCloseAffordanceFix then nil else ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.ActionUtility.Background.Transparency else 1,
			Text = "",
			ZIndex = 1,
			[ReactModule.Event.Activated] = function() --[[ Line: 344 ]]
				-- upvalues: p1 (copy), AvatarCreationService (upval)
				p1.displaySelfieQRCode(false)
				AvatarCreationService:HandleSelfieQRResult(false, "QR code closed before job completed")
			end
		}),
		Dialog = ReactModule.createElement(Dialog.Root, config1, {
			DialogContent = ReactModule.createElement(Dialog.Content, nil, {
				Layout = ReactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = if AdoptStyleTokens then UDim.new(0, UseTokensResult.Padding.Small) else UDim.new(0, 10)
				}),
				TopSpacer = ReactModule.createElement("Frame", {
					LayoutOrder = 0,
					Size = if AdoptStyleTokens then UDim2.fromOffset(0, 56) else UDim2.new(0, 0, 0, 50),
					BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.None.Transparency else 1
				}),
				HoverFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					InteractiveArea = ReactModule.createElement("TextButton", {
						Text = "",
						Size = UDim2.new(0.65, 0, 0, 0),
						BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.ActionUtility.Background.Transparency else 1,
						AutoButtonColor = false,
						[ReactModule.Event.MouseEnter] = function() --[[ Line: 386 ]]
							-- upvalues: EnableTimeoutUI (upval), UseStateResult3 (copy), AllowQrEnlargeUniversally (upval), IsUsePreferredInputResultMatch (copy), UseStateResult2_1 (copy)
							if EnableTimeoutUI and UseStateResult3 then return end
							if AllowQrEnlargeUniversally or IsUsePreferredInputResultMatch then
								UseStateResult2_1(true)
							end
						end,
						[ReactModule.Event.MouseLeave] = function() --[[ Line: 394 ]]
							-- upvalues: UseStateResult2_1 (copy)
							UseStateResult2_1(false)
						end,
						[ReactModule.Event.Activated] = function() --[[ Line: 397 ]]
							-- upvalues: EnableTimeoutUI (upval), UseStateResult3 (copy), AllowQrEnlargeUniversally (upval), IsUsePreferredInputResultMatch (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
							if EnableTimeoutUI and UseStateResult3 then return end
							if AllowQrEnlargeUniversally or IsUsePreferredInputResultMatch then
								UseStateResult2(true)
								
								if EnableTimeoutUI then
									UseStateResult2_1(false)
								end
							end
						end
					}, {
						Constraint = ReactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1,
							AspectType = Enum.AspectType.ScaleWithParentSize,
							DominantAxis = Enum.DominantAxis.Width
						}),
						BorderFrame = ReactModule.createElement("Frame", {
							Size = UDim2.new(0.98, 0, 0.98, 0),
							Position = UDim2.fromScale(0.5, 0.5),
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundTransparency = UseTokensResult.Color.ActionEmphasis.Border.Transparency
						}, {
							Stroke = ReactModule.createElement("UIStroke", {
								Thickness = 3,
								Color = if AdoptStyleTokens then UseTokensResult.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255),
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								LineJoinMode = Enum.LineJoinMode.Round,
								Transparency = if AdoptStyleTokens then UseStateResult1 and UseTokensResult.Color.ActionEmphasis.Foreground.Transparency or UseTokensResult.Color.ActionEmphasis.Border.Transparency elseif UseStateResult1 then 0 else 1
							}),
							Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.075, 0) })
						}),
						QRCodeArea = ReactModule.createElement(SelfieQRCodeView, {
							sideLength = 225,
							url = p1.url,
							outerSize = UDim2.new(0.95, 0, 0.95, 0),
							errorOccurred = if EnableTimeoutUI then UseStateResult3 else nil
						})
					})
				}),
				BottomSpacer = ReactModule.createElement("Frame", {
					LayoutOrder = 2,
					Size = if AdoptStyleTokens then UDim2.fromOffset(0, UseTokensResult.Gap.XXLarge) else UDim2.new(0, 0, 0, 30),
					BackgroundTransparency = if AdoptStyleTokens then UseTokensResult.Color.None.Transparency else 1
				}),
				TextContainerWrapper = ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2000),
					BackgroundTransparency = UseTokensResult.Color.None.Transparency
				}, {
					Layout = if EnableTimeoutUI then nil else ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					TextAndIconContainer = if EnableTimeoutUI then ReactModule.createElement("Frame", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = UseTokensResult.Color.None.Transparency
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = if UseStateResult3 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Top,
							Padding = UDim.new(0, UseTokensResult.Gap.Medium)
						}),
						WarningIcon = if UseStateResult3 then ReactModule.createElement(Icon, {
							LayoutOrder = 1,
							name = FoundationModule.Enums.IconName.TriangleExclamation,
							size = UseTokensResult.Size.Size_700,
							BackgroundTransparency = UseTokensResult.Color.None.Transparency
						}) else nil,
						TextContent = ReactModule.createElement("Frame", {
							LayoutOrder = 2,
							Size = if UseStateResult3 then UDim2.new(1, -48, 0, 0) else UDim2.fromScale(1, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundTransparency = UseTokensResult.Color.None.Transparency
						}, {
							Layout = ReactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								HorizontalAlignment = Enum.HorizontalAlignment.Left,
								Padding = UDim.new(0, UseTokensResult.Gap.Small)
							}),
							TitleText = ReactModule.createElement(Dialog.Text, {
								LayoutOrder = 3,
								Text = if UseStateResult3 then UseLocalizationResult.errorTitle else UseLocalizationResult.title,
								TextXAlignment = if UseStateResult3 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
								Font = Enum.Font.SourceSansBold
							}),
							DialogText = ReactModule.createElement(Dialog.Text, {
								LayoutOrder = 4,
								Text = if UseStateResult3 then UseLocalizationResult.errorBody else "",
								TextXAlignment = Enum.TextXAlignment.Left
							})
						})
					}) else nil,
					TitleText = if EnableTimeoutUI then nil else ReactModule.createElement(Dialog.Text, {
						LayoutOrder = 3,
						Text = UseLocalizationResult.title,
						Font = Enum.Font.SourceSansBold
					}),
					DialogText = if EnableTimeoutUI then nil else ReactModule.createElement(Dialog.Text, { LayoutOrder = 4, Text = UseLocalizationResult.body })
				})
			})
		})
	})
end