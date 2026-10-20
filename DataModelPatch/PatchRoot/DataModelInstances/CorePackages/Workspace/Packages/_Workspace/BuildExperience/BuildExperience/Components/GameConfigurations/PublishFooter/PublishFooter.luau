local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local Button = FoundationModule.Button
local Snackbar = FoundationModule.Snackbar
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local GetRootNavigationFunction = NavigationModule.getRootNavigation
local UseNavigationFunction = NavigationModule.useNavigation
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local SharePublishedExperienceFunction = require(BuildExperience.utils.sharePublishedExperience).sharePublishedExperience

local function _(Tbl)
	if typeof(Tbl.clearAppScreens) == "function" then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		
		function Copy.clearAppScreens(RouteNames)
			-- upvalues: Tbl (copy)
			Tbl.dispatch({ type = "ClearAppScreensAction", routeNames = RouteNames })
		end
		
		return Copy
	end
end

local function PreviewButton(p1)
	-- upvalues: UseStoreFunction (copy), UseNavigationFunction (copy), ReactModule (copy), GetRootNavigationFunction (copy), OpenGameDetailsFunction (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseStoreResult = UseStoreFunction()
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(Button, {
		text = "Preview",
		LayoutOrder = 2,
		size = InputSize.Large,
		variant = ButtonVariant.Standard,
		fillBehavior = FillBehavior.Fill,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: GetRootNavigationFunction (upval), UseNavigationResult (copy), OpenGameDetailsFunction (upval), p1 (copy), UseStoreResult (copy)
			local RootNavigation = GetRootNavigationFunction(UseNavigationResult)
			local Text = tostring(p1.target.universeId)
			local RootNavigation1 = nil
			
			if typeof(RootNavigation.clearAppScreens) == "function" then
				RootNavigation1 = RootNavigation
			else
				local Copy = table.clone(RootNavigation)
				
				function Copy.clearAppScreens(RouteNames)
					-- upvalues: RootNavigation (copy)
					RootNavigation.dispatch({ type = "ClearAppScreensAction", routeNames = RouteNames })
				end
				
				RootNavigation1 = Copy
			end
			OpenGameDetailsFunction(Text, RootNavigation1, { source = "BuildExperiencePublish" })(UseStoreResult)
		end, {
			UseNavigationResult,
			p1.target.universeId,
			UseStoreResult
		}),
		width = UDim.new(1, 0),
		testId = `{p1.actionsTestId}-preview`
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), UniverseActivationModule (copy), SignalsReactModule (copy), UniverseConfigurationModule (copy), GameConfigurationLabelsModule (copy), SharePublishedExperienceFunction (copy), View (copy), Snackbar (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), PreviewButton (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UniverseActivationModule (upval)
		return UniverseActivationModule.getUniverseActivationStore()
	end, {})
	local IsPrivateAudience = GameConfigurationLabelsModule.isPrivateAudience((SignalsReactModule.useSignalState(SignalsReactModule.useSignalState(UniverseConfigurationModule.getUniverseConfigurationStore).getAndFetchConfiguration(p1.target.universeId).data)))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2_1("")
		UseStateResult2_2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), IsPrivateAudience (copy), SharePublishedExperienceFunction (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if p1.target.placeId == nil or IsPrivateAudience then return end
		if SharePublishedExperienceFunction(p1.target.placeId).copiedToClipboard then
			UseStateResult2_1("Link copied to clipboard.")
			UseStateResult2_2(false)
		end
	end, { IsPrivateAudience, p1.target.placeId })
	local ActionsName: string = `{p1.testId}.actions`
	
	return ReactModule.createElement(View, {
		LayoutOrder = 3,
		tag = "col gap-small size-full-0 auto-y bg-surface-0"
	}, {
		PublishSnackbarWrapper = if UseStateResult1 == "" then nil else ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = ReactModule.createElement(Snackbar, {
				LayoutOrder = 1,
				title = UseStateResult1,
				action = if UseStateResult3 then { text = "Share", onActivated = UseResult1 } else nil,
				onClose = if UseStateResult3 then nil else UseResult,
				testId = `{p1.testId}.publish-snackbar`
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-y-medium",
			testId = ActionsName
		}, {
			Publish = ReactModule.createElement(Button, {
				text = "Publish",
				LayoutOrder = 1,
				size = InputSize.Large,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isLoading = UseStateResult,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseResult (copy), UseMemoResult (copy), p1 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), IsPrivateAudience (copy)
					if not UseStateResult then
						UseStateResult2(true)
						UseResult()
						UseMemoResult.activate(p1.target.universeId):andThen(function()
							-- upvalues: UseStateResult2_1 (upval), UseStateResult2_2 (upval), p1 (upval), IsPrivateAudience (upval)
							UseStateResult2_1("Eligible players can now play this game in Roblox.")
							UseStateResult2_2(p1.target.placeId ~= nil and not IsPrivateAudience)
						end):catch(function()
							-- upvalues: UseStateResult2_1 (upval), UseStateResult2_2 (upval)
							UseStateResult2_1("Couldn't publish game. Please check Audience settings.")
							UseStateResult2_2(false)
						end):finally(function()
							-- upvalues: UseStateResult2 (upval)
							UseStateResult2(false)
						end)
						
						return
					end
				end, {
					UseMemoResult, UseResult, IsPrivateAudience, UseStateResult, p1.target.placeId,
					p1.target.universeId
				}),
				width = UDim.new(1, 0),
				testId = `{ActionsName}-publish`
			}),
			Preview = if p1.showPreviewButton == false then nil else ReactModule.createElement(PreviewButton, { target = p1.target, actionsTestId = ActionsName })
		})
	})
end