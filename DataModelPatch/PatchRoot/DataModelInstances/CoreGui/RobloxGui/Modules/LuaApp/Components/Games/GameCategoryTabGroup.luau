local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local TopicInfosReducer = require(CorePackages.Workspace.Packages.TopicInfosRodux).TopicInfosReducer
local UseAnimatedScrollToSelectionFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useAnimatedScrollToSelection
local IconTabGroup = require(CorePackages.Packages.UIBlox).App.Navigation.PrimaryNavBar.IconTabGroup
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagExtendScrollingFramesBySafeInsets = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local OmniFeedTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedTypes

return function(p1)
	-- upvalues: UseSelectorFunction (copy), TopicInfosReducer (copy), ReactModule (copy), OmniFeedTypes (copy), CryoModule (copy), UseAnimatedScrollToSelectionFunction (copy), FFlagEnableLeftNavOnConsole (copy), FFlagExtendScrollingFramesBySafeInsets (copy), UseSignalStateFunction (copy), DisplayModule (copy), IconTabGroup (copy)
	local Size = p1.size
	local OnSelectedFunction = p1.onSelected
	local SelectedSortIndex = p1.selectedSortIndex
	local SelectedSortName = p1.selectedSortName
	local SortCategories = p1.sortCategories
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: TopicInfosReducer (upval)
		return p2.Personalization[TopicInfosReducer.key]
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.GameSortGroups
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		return p2.OmniRecommendations
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SortCategories (copy), UseSelectorResult2 (copy), OmniFeedTypes (upval), UseSelectorResult (copy), UseSelectorResult1 (copy)
		local List = {}
		
		local function _(Sort, StoreIndex)
			-- upvalues: List (copy)
			table.insert(List, { sort = Sort, storeIndex = StoreIndex })
		end
		
		for _, sortCategory in SortCategories do
			if sortCategory.isOmni then
				if UseSelectorResult2[sortCategory.sortType] and UseSelectorResult2[sortCategory.sortType].sorts then
					for StoreIndex, sort in UseSelectorResult2[sortCategory.sortType].sorts do
						if sort.treatmentType == OmniFeedTypes.Carousel then
							table.insert(List, {
								sort = UseSelectorResult[sort.topicId],
								storeIndex = StoreIndex
							})
						end
					end
				end
			else
				for StoreIndex1, sort1 in UseSelectorResult1[sortCategory.sortType].sorts do
					table.insert(List, {
						sort = UseSelectorResult[sort1],
						storeIndex = StoreIndex1
					})
				end
			end
		end
		return List
	end, {
		UseSelectorResult,
		UseSelectorResult1,
		UseSelectorResult2,
		SortCategories
	})
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: OnSelectedFunction (copy), UseMemoResult (copy)
		if OnSelectedFunction and p3 <= #UseMemoResult then
			local StoreIndex = p2.storeIndex
			
			if StoreIndex then
				return OnSelectedFunction(p2.sort, StoreIndex, p3)
			end
		end
		return nil
	end, { OnSelectedFunction, UseMemoResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseMemoResult (copy), UseResult (copy), SelectedSortName (copy)
		return CryoModule.List.map(UseMemoResult, function(p2, p3)
			-- upvalues: UseResult (upval), SelectedSortName (upval)
			return {
				title = p2.sort.displayName,
				onActivated = function()
					-- upvalues: UseResult (upval), p2 (copy), p3 (copy)
					UseResult(p2, p3)
				end,
				showRoundedBackground = p2.sort.uniqueKey == SelectedSortName
			}
		end)
	end, { UseMemoResult, SelectedSortName })
	local UseAnimatedScrollToSelectionResult, UseAnimatedScrollToSelectionResult2 = UseAnimatedScrollToSelectionFunction(Enum.ScrollingDirection.X, if p1.padding then p1.padding.left else 0)
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole and FFlagExtendScrollingFramesBySafeInsets then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return ReactModule.createElement("ScrollingFrame", {
		Size = UDim2.new(1, if FFlagEnableLeftNavOnConsole and FFlagExtendScrollingFramesBySafeInsets then UseSignalStateResult.right else 0, 1, 0),
		Selectable = false,
		ClipsDescendants = true,
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		CanvasSize = UDim2.new(0, 0, 1, 0),
		CanvasPosition = UseAnimatedScrollToSelectionResult,
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.X,
		BackgroundTransparency = 1,
		[ReactModule.Event.SelectionChanged] = UseAnimatedScrollToSelectionResult2
	}, {
		TabGroup = ReactModule.createElement(IconTabGroup, {
			size = Size,
			fillDirection = Enum.FillDirection.Horizontal,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			sortOrder = Enum.SortOrder.LayoutOrder,
			items = UseMemoResult1,
			selection = { SelectedSortIndex },
			padding = p1.padding or { left = 0, right = 0, top = 0, bottom = 0 }
		}),
		UIPadding = if FFlagEnableLeftNavOnConsole and FFlagExtendScrollingFramesBySafeInsets then ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, UseSignalStateResult.right) }) else nil
	})
end