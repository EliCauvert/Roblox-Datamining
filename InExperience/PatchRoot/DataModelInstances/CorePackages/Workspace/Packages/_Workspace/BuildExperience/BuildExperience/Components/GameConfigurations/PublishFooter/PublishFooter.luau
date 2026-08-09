local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local gameDetailModule = require(parent.GameDetail)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local button = foundationModule.Button
local snackbar = foundationModule.Snackbar
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local getRootNavigation = navigationModule.getRootNavigation
local useNavigation = navigationModule.useNavigation
local openGameDetails = gameDetailModule.OpenGameDetails
local sharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).sharePublishedExperience

local function _(p0) --[[ line: 38 | named "getGameDetailsNavigation" ]]
	if typeof(p0.clearAppScreens) == "function" then
		return p0
	end
	local cloned = table.clone(p0)
	
	function cloned.clearAppScreens(p1) --[[ line: 44 ]]
		-- upvalues: p0 (ref)
		p0.dispatch({ type = "ClearAppScreensAction", routeNames = p1 })
	end
	
	return cloned
end

local function PreviewButton(p2) --[[ line: 60 ]]
	-- upvalues: useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var8 = useStore()
	local var9 = useNavigation()
	
	return reactModule.createElement(button, {
		text = "Preview",
		LayoutOrder = 2,
		size = inputSize.Large,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function() --[[ line: 67 ]]
			-- upvalues: getRootNavigation (copy), var9 (ref), openGameDetails (copy), p2 (ref), var8 (ref)
			local var12
			local var10 = getRootNavigation(var9)
			local var11 = tostring(p2.target.universeId)
			
			if typeof(var10.clearAppScreens) == "function" then
				var12 = var10
			else
				local cloned = table.clone(var10)
				
				function cloned.clearAppScreens(p3) --[[ line: 44 ]]
					-- upvalues: var10 (ref)
					var10.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
				end
				
				var12 = cloned
			end
			openGameDetails(var11, var12, { source = "BuildExperiencePublish" })(var8)
		end, { var9, p2.target.universeId, var8 }),
		width = UDim.new(1, 0),
		testId = `{p2.actionsTestId}-preview`
	})
end

return function(p4) --[[ line: 86 | named "PublishFooter" ]]
	-- upvalues: reactModule (ref), universeActivationModule (ref), sharePublishedExperience (ref), view (ref), snackbar (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref)
	local var14 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: universeActivationModule (copy)
		return universeActivationModule.getUniverseActivationStore()
	end, {})
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState("")
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useCallback(function() --[[ line: 94 ]]
		-- upvalues: var18 (ref), var20 (ref)
		var18("")
		var20(false)
	end, {})
	local testId = `{p4.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "col gap-small size-full-0 auto-y bg-surface-0"
	}, {
		PublishSnackbarWrapper = if var17 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(snackbar, {
				LayoutOrder = 1,
				title = var17,
				action = if var19 then {
					text = "Share",
					onActivated = reactModule.useCallback(function() --[[ line: 99 ]]
						-- upvalues: p4 (ref), sharePublishedExperience (copy), var18 (ref), var20 (ref)
						if p4.target.placeId == nil then return end
						if sharePublishedExperience(p4.target.placeId).copiedToClipboard then
							var18("Link copied to clipboard.")
							var20(false)
						end
					end, { p4.target.placeId })
				} else nil,
				onClose = if var19 then nil else var21,
				testId = `{p4.testId}.publish-snackbar`
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-x-large padding-y-medium stroke-standard stroke-default",
			testId = testId
		}, {
			Publish = reactModule.createElement(button, {
				text = "Publish",
				LayoutOrder = 1,
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = var15,
				onActivated = reactModule.useCallback(function() --[[ line: 111 ]]
					-- upvalues: var15 (ref), var16 (ref), var21 (ref), var14 (ref), p4 (ref), var18 (ref), var20 (ref)
					if var15 then
						return
					end
					var16(true)
					var21()
					var14.activate(p4.target.universeId):andThen(function() --[[ line: 120 ]]
						-- upvalues: var18 (copy), var20 (copy), p4 (copy)
						var18("Eligible players can now play this game in Roblox.")
						var20(p4.target.placeId ~= nil)
					end):catch(function() --[[ line: 124 ]]
						-- upvalues: var18 (copy), var20 (copy)
						var18("Couldn't publish game. Please check Audience settings.")
						var20(false)
					end):finally(function() --[[ line: 128 ]]
						-- upvalues: var16 (copy)
						var16(false)
					end)
				end, { var14, var21, var15, p4.target }),
				width = UDim.new(1, 0),
				testId = `{testId}-publish`
			}),
			Preview = if p4.showPreviewButton == false then nil else reactModule.createElement(PreviewButton, { target = p4.target, actionsTestId = testId })
		})
	})
end