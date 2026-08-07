local editProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local parent = editProfileBackground.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local editProfileBackgroundTopBarModule = require(editProfileBackground.Components.editProfileBackgroundTopBar)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local selectionCarouselModule = require(editProfileBackground.Components.SelectionCarousel)
local displayBackgroundModule = require(editProfileBackground.Components.DisplayBackground)
local profileCustomizationNetworkingModule = require(editProfileBackground.Networking.ProfileCustomizationNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local view = require(parent.Foundation).View
local socialToastModule = require(parent.SocialToast)
local errorHandlingModule = require(editProfileBackground.Common.ErrorHandling)
local constantsModule = require(editProfileBackground.Common.Constants)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local cryoModule = require(parent.Cryo)
local analyticsModule = require(editProfileBackground.Analytics)
local useAnalytics = analyticsModule.useAnalytics
local eventNames = analyticsModule.EventNames
local errorTypes = analyticsModule.ErrorTypes
local var13 = constantsModule.BACKGROUND_ASSET_IDS[1]
local DEFAULT_ERROR_MESSAGES = errorHandlingModule.DEFAULT_ERROR_MESSAGES
local insertService = game:GetService("InsertService")

local function _(value) --[[ line: 52 | named "preloadBackgroundAssets" ]]
	-- upvalues: cryoModule (ref), constantsModule (ref), var13 (ref), insertService (ref), eventNames (ref), errorTypes (ref)
	task.spawn(function() --[[ line: 53 ]]
		-- upvalues: cryoModule (copy), constantsModule (copy), var13 (copy), insertService (copy), value (ref), eventNames (copy), errorTypes (copy)
		for i, v in ipairs(cryoModule.Dictionary.join(constantsModule.DEFAULT_BACKGROUND_ASSET_IDS, cryoModule.List.filter(constantsModule.BACKGROUND_ASSET_IDS, function(p0) --[[ line: 57 ]]
			-- upvalues: var13 (copy)
			return p0 ~= var13
		end))) do
			local ok, status = pcall(function() --[[ line: 63 ]]
				-- upvalues: insertService (copy), v (ref)
				return insertService:LoadAsset(v)
			end)
			
			if ok and status then
				status:Destroy()
			else
				value.fireAnalyticsEvent(eventNames.EditProfileBackgroundFailure, { errorType = errorTypes.AssetPreloadFailed })
			end
		end
	end)
end

return function(value) --[[ line: 84 | named "EditProfileBackgroundPage" ]]
	-- upvalues: useScreenSize (ref), useLocalUserId (ref), useDispatch (ref), socialToastModule (ref), useAnalytics (ref), useSelector (ref), useEffectOnMount (ref), eventNames (ref), cryoModule (ref), constantsModule (ref), var13 (ref), insertService (ref), errorTypes (ref), reactModule (ref), useNavigation (ref), profileCustomizationNetworkingModule (ref), DEFAULT_ERROR_MESSAGES (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), view (ref), editProfileBackgroundTopBarModule (ref), displayBackgroundModule (ref), selectionCarouselModule (ref)
	local var15 = useScreenSize()
	local var16 = useLocalUserId()
	local var17 = useDispatch()
	local var18 = socialToastModule.useOpenToast()
	local var19 = useAnalytics()
	local var20 = useSelector(function(p1) --[[ line: 92 ]]
		return if p1.GlobalGuiInset then p1.GlobalGuiInset.bottom + 5 else 0
	end)
	useEffectOnMount(function() --[[ line: 96 ]]
		-- upvalues: var19 (ref), eventNames (copy), cryoModule (copy), constantsModule (copy), var13 (copy), insertService (copy), errorTypes (copy)
		var19.fireAnalyticsEvent(eventNames.EditProfileBackgroundOpened)
		local currentTime = tick()
		task.spawn(function() --[[ line: 53 ]]
			-- upvalues: cryoModule (copy), constantsModule (copy), var13 (copy), insertService (copy), var19 (ref), eventNames (copy), errorTypes (copy)
			for i, v in ipairs(cryoModule.Dictionary.join(constantsModule.DEFAULT_BACKGROUND_ASSET_IDS, cryoModule.List.filter(constantsModule.BACKGROUND_ASSET_IDS, function(p2) --[[ line: 57 ]]
				-- upvalues: var13 (copy)
				return p2 ~= var13
			end))) do
				local ok, status = pcall(function() --[[ line: 63 ]]
					-- upvalues: insertService (copy), v (ref)
					return insertService:LoadAsset(v)
				end)
				
				if ok and status then
					status:Destroy()
				else
					var19.fireAnalyticsEvent(eventNames.EditProfileBackgroundFailure, { errorType = errorTypes.AssetPreloadFailed })
				end
			end
		end)
		var19.fireAnalyticsEvent(eventNames.EditProfileBackgroundLoadingStage, { status = "loaded", statValue = tick() - currentTime })
	end)
	local var21 = if value.profileBackgroundData and value.profileBackgroundData.assetId then value.profileBackgroundData.assetId else var13
	local var22, var23 = reactModule.useState(nil)
	local var22_1 = var22 or var21
	local var25 = reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: var15 (ref), var20 (ref)
		local minValue = math.min(640, var15.X)
		local var29 = if minValue >= 540 then 8 else 4
		local ceiled = math.ceil(8 / var29)
		local var31 = (minValue - 32 - (var29 - 1) * 16) / var29
		local var32 = ceiled * var31 + (ceiled + 1) * 16
		local var33 = var15.Y - 48 - 40 - 24 - var20
		
		return {
			width = minValue,
			buttonSize = var31,
			carouselHeight = var32,
			contentAreaHeight = var33,
			displayBackgroundHeight = var33 - var32,
			buttonsPerRow = var29,
			numRows = ceiled
		}
	end, { var15, var20 })
	local var26 = useNavigation()
	
	return reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p3) --[[ line: 197 ]]
					-- upvalues: value (ref), var26 (ref)
					if value.onBackgroundChanged then
						value.onBackgroundChanged()
					end
					var26.goBack()
					p3:cancel()
				end)
			}
		}
	}, {
		reactModule.createElement(view, {
			tag = "size-full bg-surface-0 anchor-top-right position-top-right"
		}, {
			SizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 1e999) }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 24)
			}),
			TopPadding = reactModule.createElement(view, { tag = "size-full-500" }),
			TopBar = reactModule.createElement(editProfileBackgroundTopBarModule, {
				layoutOrder = 1,
				onClose = function() --[[ line: 143 ]]
					-- upvalues: value (ref), var26 (ref)
					if value.onBackgroundChanged then
						value.onBackgroundChanged()
					end
					var26.goBack()
				end
			}),
			ContentArea = reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var25.contentAreaHeight)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				BackgroundDisplay = reactModule.createElement(displayBackgroundModule, {
					LayoutOrder = 1,
					height = var25.displayBackgroundHeight,
					currentBackgroundId = var22_1,
					userId = tonumber(var16),
					analytics = var19
				}),
				SelectionCarousel = reactModule.createElement(selectionCarouselModule, {
					LayoutOrder = 2,
					height = var25.carouselHeight,
					width = var25.width,
					buttonSize = var25.buttonSize,
					buttonsPerRow = var25.buttonsPerRow,
					numRows = var25.numRows,
					onBackgroundSelected = function(value_1) --[[ line: 151 ]]
						-- upvalues: var19 (ref), eventNames (copy), var23 (ref), var16 (ref), var17 (ref), profileCustomizationNetworkingModule (copy), value (ref), errorTypes (copy), var18 (ref), DEFAULT_ERROR_MESSAGES (copy)
						var19.fireAnalyticsEvent(eventNames.BackgroundSelected, { backgroundId = value_1 })
						var23(value_1)
						task.spawn(function() --[[ line: 158 ]]
							-- upvalues: var16 (copy), value_1 (ref), var17 (copy), profileCustomizationNetworkingModule (copy), value (copy), var19 (copy), eventNames (copy), errorTypes (copy), var18 (copy), DEFAULT_ERROR_MESSAGES (copy)
							var17(profileCustomizationNetworkingModule.UpdateProfileCustomization.API({
								profileEntity = { type = "User", id = tostring(var16) },
								customizedComponents = { profileBackground = { assetId = value_1 } }
							})):andThen(function(_) --[[ line: 172 ]]
								-- upvalues: value (copy)
								if value.onBackgroundChanged then
									value.onBackgroundChanged()
								end
							end):catch(function(p4) --[[ line: 177 ]]
								-- upvalues: var19 (copy), eventNames (copy), errorTypes (copy), var18 (copy), DEFAULT_ERROR_MESSAGES (copy)
								var19.fireAnalyticsEvent(eventNames.EditProfileBackgroundFailure, {
									errorType = errorTypes.BackgroundSaveFailed,
									errorCode = tostring(if p4 then p4.StatusCode else "unknown")
								})
								var18({
									toastTitle = DEFAULT_ERROR_MESSAGES.SAVE_BACKGROUND,
									iconImage = { Image = "icons/actions/error" }
								})
							end)
						end)
					end,
					currentBackgroundId = var22_1
				})
			})
		})
	})
end