local EditProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local Parent = EditProfileBackground.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local EditProfileBackgroundTopBarModule = require(EditProfileBackground.Components.editProfileBackgroundTopBar)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local SelectionCarouselModule = require(EditProfileBackground.Components.SelectionCarousel)
local DisplayBackgroundModule = require(EditProfileBackground.Components.DisplayBackground)
local ProfileCustomizationNetworkingModule = require(EditProfileBackground.Networking.ProfileCustomizationNetworking)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local View = require(Parent.Foundation).View
local SocialToastModule = require(Parent.SocialToast)
local ConstantsModule = require(EditProfileBackground.Common.Constants)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local CryoModule = require(Parent.Cryo)
local AnalyticsModule = require(EditProfileBackground.Analytics)
local UseAnalyticsFunction = AnalyticsModule.useAnalytics
local EventNames = AnalyticsModule.EventNames
local ErrorTypes = AnalyticsModule.ErrorTypes
local BACKGROUNDASSETID = ConstantsModule.BACKGROUND_ASSET_IDS[1]
local DEFAULTERRORMESSAGES = require(EditProfileBackground.Common.ErrorHandling).DEFAULT_ERROR_MESSAGES
local InsertService = game:GetService("InsertService")

local function _(p1)
	-- upvalues: CryoModule (copy), ConstantsModule (copy), BACKGROUNDASSETID (copy), InsertService (copy), EventNames (copy), ErrorTypes (copy)
	task.spawn(function()
		-- upvalues: CryoModule (upval), ConstantsModule (upval), BACKGROUNDASSETID (upval), InsertService (upval), p1 (copy), EventNames (upval), ErrorTypes (upval)
		for _, value in ipairs((CryoModule.Dictionary.join(ConstantsModule.DEFAULT_BACKGROUND_ASSET_IDS, CryoModule.List.filter(ConstantsModule.BACKGROUND_ASSET_IDS, function(p2): boolean
			-- upvalues: BACKGROUNDASSETID (upval)
			return p2 ~= BACKGROUNDASSETID
		end)))) do
			local Success, Result = pcall(function()
				-- upvalues: InsertService (upval), value (copy)
				return InsertService:LoadAsset(value)
			end)
			
			if Success and Result then
				Result:Destroy()
			else
				p1.fireAnalyticsEvent(EventNames.EditProfileBackgroundFailure, { errorType = ErrorTypes.AssetPreloadFailed })
			end
		end
	end)
end

return function(p2)
	-- upvalues: UseScreenSizeFunction (copy), UseLocalUserIdFunction (copy), UseDispatchFunction (copy), SocialToastModule (copy), UseAnalyticsFunction (copy), UseSelectorFunction (copy), UseEffectOnMountFunction (copy), EventNames (copy), CryoModule (copy), ConstantsModule (copy), BACKGROUNDASSETID (copy), InsertService (copy), ErrorTypes (copy), ReactModule (copy), UseNavigationFunction (copy), ProfileCustomizationNetworkingModule (copy), DEFAULTERRORMESSAGES (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), View (copy), EditProfileBackgroundTopBarModule (copy), DisplayBackgroundModule (copy), SelectionCarouselModule (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseOpenToastResult = SocialToastModule.useOpenToast()
	local UseAnalyticsResult = UseAnalyticsFunction()
	local UseSelectorResult = UseSelectorFunction(function(p3): number
		return if p3.GlobalGuiInset then p3.GlobalGuiInset.bottom + 5 else 0
	end)
	UseEffectOnMountFunction(function()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval), CryoModule (upval), ConstantsModule (upval), BACKGROUNDASSETID (upval), InsertService (upval), ErrorTypes (upval)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditProfileBackgroundOpened)
		local CurrentTime = tick()
		task.spawn(function()
			-- upvalues: CryoModule (upval), ConstantsModule (upval), BACKGROUNDASSETID (upval), InsertService (upval), UseAnalyticsResult (copy), EventNames (upval), ErrorTypes (upval)
			for _, value in ipairs((CryoModule.Dictionary.join(ConstantsModule.DEFAULT_BACKGROUND_ASSET_IDS, CryoModule.List.filter(ConstantsModule.BACKGROUND_ASSET_IDS, function(p3): boolean
				-- upvalues: BACKGROUNDASSETID (upval)
				return p3 ~= BACKGROUNDASSETID
			end)))) do
				local Success, Result = pcall(function()
					-- upvalues: InsertService (upval), value (copy)
					return InsertService:LoadAsset(value)
				end)
				
				if Success and Result then
					Result:Destroy()
				else
					UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditProfileBackgroundFailure, { errorType = ErrorTypes.AssetPreloadFailed })
				end
			end
		end)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditProfileBackgroundLoadingStage, { status = "loaded", statValue = tick() - CurrentTime })
	end)
	local AssetId = if p2.profileBackgroundData and p2.profileBackgroundData.assetId then p2.profileBackgroundData.assetId else BACKGROUNDASSETID
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1 = UseStateResult or AssetId
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseScreenSizeResult (copy), UseSelectorResult (copy)
		local Smallest = math.min(640, UseScreenSizeResult.X)
		local ButtonsPerRow: number = if Smallest >= 540 then 8 else 4
		local Ceiled = math.ceil(8 / ButtonsPerRow)
		local SmallestRatio = (Smallest - 32 - (ButtonsPerRow - 1) * 16) / ButtonsPerRow
		local NewCeiled = Ceiled * SmallestRatio + (Ceiled + 1) * 16
		local YDelta = UseScreenSizeResult.Y - 48 - 40 - 24 - UseSelectorResult
		
		return {
			width = Smallest,
			buttonSize = SmallestRatio,
			carouselHeight = NewCeiled,
			contentAreaHeight = YDelta,
			displayBackgroundHeight = YDelta - NewCeiled,
			buttonsPerRow = ButtonsPerRow,
			numRows = Ceiled
		}
	end, { UseScreenSizeResult, UseSelectorResult })
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p3)
					-- upvalues: p2 (copy), UseNavigationResult (copy)
					if p2.onBackgroundChanged then
						p2.onBackgroundChanged()
					end
					UseNavigationResult.goBack()
					p3:cancel()
				end)
			}
		}
	}, {
		ReactModule.createElement(View, {
			tag = "size-full bg-surface-0 anchor-top-right position-top-right"
		}, {
			SizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 1e999) }),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 24)
			}),
			TopPadding = ReactModule.createElement(View, { tag = "size-full-500" }),
			TopBar = ReactModule.createElement(EditProfileBackgroundTopBarModule, {
				layoutOrder = 1,
				onClose = function()
					-- upvalues: p2 (copy), UseNavigationResult (copy)
					if p2.onBackgroundChanged then
						p2.onBackgroundChanged()
					end
					UseNavigationResult.goBack()
				end
			}),
			ContentArea = ReactModule.createElement(View, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseMemoResult.contentAreaHeight)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 0)
				}),
				BackgroundDisplay = ReactModule.createElement(DisplayBackgroundModule, {
					LayoutOrder = 1,
					height = UseMemoResult.displayBackgroundHeight,
					currentBackgroundId = UseStateResult1,
					userId = tonumber(UseLocalUserIdResult),
					analytics = UseAnalyticsResult
				}),
				SelectionCarousel = ReactModule.createElement(SelectionCarouselModule, {
					LayoutOrder = 2,
					height = UseMemoResult.carouselHeight,
					width = UseMemoResult.width,
					buttonSize = UseMemoResult.buttonSize,
					buttonsPerRow = UseMemoResult.buttonsPerRow,
					numRows = UseMemoResult.numRows,
					onBackgroundSelected = function(AssetId)
						-- upvalues: UseAnalyticsResult (copy), EventNames (upval), UseStateResult2 (copy), UseLocalUserIdResult (copy), UseDispatchResult (copy), ProfileCustomizationNetworkingModule (upval), p2 (copy), ErrorTypes (upval), UseOpenToastResult (copy), DEFAULTERRORMESSAGES (upval)
						UseAnalyticsResult.fireAnalyticsEvent(EventNames.BackgroundSelected, { backgroundId = AssetId })
						UseStateResult2(AssetId)
						task.spawn(function()
							-- upvalues: UseLocalUserIdResult (upval), AssetId (copy), UseDispatchResult (upval), ProfileCustomizationNetworkingModule (upval), p2 (upval), UseAnalyticsResult (upval), EventNames (upval), ErrorTypes (upval), UseOpenToastResult (upval), DEFAULTERRORMESSAGES (upval)
							UseDispatchResult(ProfileCustomizationNetworkingModule.UpdateProfileCustomization.API({
								profileEntity = { type = "User", id = tostring(UseLocalUserIdResult) },
								customizedComponents = { profileBackground = { assetId = AssetId } }
							})):andThen(function(_)
								-- upvalues: p2 (upval)
								if p2.onBackgroundChanged then
									p2.onBackgroundChanged()
								end
							end):catch(function(Err)
								-- upvalues: UseAnalyticsResult (upval), EventNames (upval), ErrorTypes (upval), UseOpenToastResult (upval), DEFAULTERRORMESSAGES (upval)
								UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditProfileBackgroundFailure, {
									errorType = ErrorTypes.BackgroundSaveFailed,
									errorCode = tostring(Err and Err.StatusCode or "unknown")
								})
								UseOpenToastResult({
									toastTitle = DEFAULTERRORMESSAGES.SAVE_BACKGROUND,
									iconImage = { Image = "icons/actions/error" }
								})
							end)
						end)
					end,
					currentBackgroundId = UseStateResult1
				})
			})
		})
	})
end