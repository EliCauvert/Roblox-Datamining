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
local var1 = constantsModule.BACKGROUND_ASSET_IDS[1]
local DEFAULT_ERROR_MESSAGES = errorHandlingModule.DEFAULT_ERROR_MESSAGES
local insertService = game:GetService("InsertService")

local function _(value)
	-- upvalues: cryoModule (ref), constantsModule (ref), var1 (ref), insertService (ref), eventNames (ref), errorTypes (ref)
	task.spawn(function()
		-- upvalues: cryoModule (copy), constantsModule (copy), var1 (copy), insertService (copy), value (ref), eventNames (copy), errorTypes (copy)
		for i, v in ipairs(cryoModule.Dictionary.join(constantsModule.DEFAULT_BACKGROUND_ASSET_IDS, cryoModule.List.filter(constantsModule.BACKGROUND_ASSET_IDS, function(p1)
			-- upvalues: var1 (copy)
			return p1 ~= var1
		end))) do
			local ok, status = pcall(function()
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

return function(value)
	-- upvalues: useScreenSize (ref), useLocalUserId (ref), useDispatch (ref), socialToastModule (ref), useAnalytics (ref), useSelector (ref), useEffectOnMount (ref), eventNames (ref), cryoModule (ref), constantsModule (ref), var1 (ref), insertService (ref), errorTypes (ref), reactModule (ref), useNavigation (ref), profileCustomizationNetworkingModule (ref), DEFAULT_ERROR_MESSAGES (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), view (ref), editProfileBackgroundTopBarModule (ref), displayBackgroundModule (ref), selectionCarouselModule (ref)
	local var2 = useScreenSize()
	local var3 = useLocalUserId()
	local var4 = useDispatch()
	local var5 = socialToastModule.useOpenToast()
	local var6 = useAnalytics()
	local var7 = useSelector(function(p1)
		return if p1.GlobalGuiInset then p1.GlobalGuiInset.bottom + 5 else 0
	end)
	useEffectOnMount(function()
		-- upvalues: var6 (ref), eventNames (copy), cryoModule (copy), constantsModule (copy), var1 (copy), insertService (copy), errorTypes (copy)
		var6.fireAnalyticsEvent(eventNames.EditProfileBackgroundOpened)
		local currentTime = tick()
		task.spawn(function()
			-- upvalues: cryoModule (copy), constantsModule (copy), var1 (copy), insertService (copy), var6 (ref), eventNames (copy), errorTypes (copy)
			for i, v in ipairs(cryoModule.Dictionary.join(constantsModule.DEFAULT_BACKGROUND_ASSET_IDS, cryoModule.List.filter(constantsModule.BACKGROUND_ASSET_IDS, function(p1)
				-- upvalues: var1 (copy)
				return p1 ~= var1
			end))) do
				local ok, status = pcall(function()
					-- upvalues: insertService (copy), v (ref)
					return insertService:LoadAsset(v)
				end)
				
				if ok and status then
					status:Destroy()
				else
					var6.fireAnalyticsEvent(eventNames.EditProfileBackgroundFailure, { errorType = errorTypes.AssetPreloadFailed })
				end
			end
		end)
		var6.fireAnalyticsEvent(eventNames.EditProfileBackgroundLoadingStage, { status = "loaded", statValue = tick() - currentTime })
	end)
	local var8 = if value.profileBackgroundData and value.profileBackgroundData.assetId then value.profileBackgroundData.assetId else var1
	local var9, var10 = reactModule.useState(nil)
	local var11 = var9 or var8
	local var12 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var7 (ref)
		local minValue = math.min(640, var2.X)
		local var13 = if minValue >= 540 then 8 else 4
		local ceiled = math.ceil(8 / var13)
		local var14 = (minValue - 32 - (var13 - 1) * 16) / var13
		local var15 = ceiled * var14 + (ceiled + 1) * 16
		local var16 = var2.Y - 48 - 40 - 24 - var7
		
		return {
			width = minValue,
			buttonSize = var14,
			carouselHeight = var15,
			contentAreaHeight = var16,
			displayBackgroundHeight = var16 - var15,
			buttonsPerRow = var13,
			numRows = ceiled
		}
	end, { var2, var7 })
	local var13 = useNavigation()
	
	return reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p1)
					-- upvalues: value (ref), var13 (ref)
					if value.onBackgroundChanged then
						value.onBackgroundChanged()
					end
					var13.goBack()
					p1:cancel()
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
				onClose = function()
					-- upvalues: value (ref), var13 (ref)
					if value.onBackgroundChanged then
						value.onBackgroundChanged()
					end
					var13.goBack()
				end
			}),
			ContentArea = reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var12.contentAreaHeight)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				BackgroundDisplay = reactModule.createElement(displayBackgroundModule, {
					LayoutOrder = 1,
					height = var12.displayBackgroundHeight,
					currentBackgroundId = var11,
					userId = tonumber(var3),
					analytics = var6
				}),
				SelectionCarousel = reactModule.createElement(selectionCarouselModule, {
					LayoutOrder = 2,
					height = var12.carouselHeight,
					width = var12.width,
					buttonSize = var12.buttonSize,
					buttonsPerRow = var12.buttonsPerRow,
					numRows = var12.numRows,
					onBackgroundSelected = function(value_1)
						-- upvalues: var6 (ref), eventNames (copy), var10 (ref), var3 (ref), var4 (ref), profileCustomizationNetworkingModule (copy), value (ref), errorTypes (copy), var5 (ref), DEFAULT_ERROR_MESSAGES (copy)
						var6.fireAnalyticsEvent(eventNames.BackgroundSelected, { backgroundId = value_1 })
						var10(value_1)
						task.spawn(function()
							-- upvalues: var3 (copy), value_1 (ref), var4 (copy), profileCustomizationNetworkingModule (copy), value (copy), var6 (copy), eventNames (copy), errorTypes (copy), var5 (copy), DEFAULT_ERROR_MESSAGES (copy)
							var4(profileCustomizationNetworkingModule.UpdateProfileCustomization.API({
								profileEntity = { type = "User", id = tostring(var3) },
								customizedComponents = { profileBackground = { assetId = value_1 } }
							})):andThen(function(_)
								-- upvalues: value (copy)
								if value.onBackgroundChanged then
									value.onBackgroundChanged()
								end
							end):catch(function(p1)
								-- upvalues: var6 (copy), eventNames (copy), errorTypes (copy), var5 (copy), DEFAULT_ERROR_MESSAGES (copy)
								var6.fireAnalyticsEvent(eventNames.EditProfileBackgroundFailure, {
									errorType = errorTypes.BackgroundSaveFailed,
									errorCode = tostring(if p1 then p1.StatusCode else "unknown")
								})
								var5({
									toastTitle = DEFAULT_ERROR_MESSAGES.SAVE_BACKGROUND,
									iconImage = { Image = "icons/actions/error" }
								})
							end)
						end)
					end,
					currentBackgroundId = var11
				})
			})
		})
	})
end