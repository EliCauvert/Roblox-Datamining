local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ScrollingListWithArrowsAndGradientModule = require(Modules.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient)
local FitFrameHorizontal = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)

local function selectCategoryIndex(p1)
	return p1.AvatarExperience.AvatarEditor.Categories.category
end

local function selectSubcategoryIndex(p1)
	return p1.AvatarExperience.AvatarEditor.Categories.subcategory
end

local function SubcategoryPill(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), ReactModule (copy), SetCategoryAndSubcategoryModule (copy), FoundationModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({ label = p1.subCategory.Title })
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	
	return ReactModule.createElement(FoundationModule.Chip, {
		text = UseLocalizationResult.label,
		isChecked = p1.isActive,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), p1 (copy), UseRoactServiceModuleResult (copy)
			UseDispatchResult(SetCategoryAndSubcategoryModule(p1.subCategory.Category, p1.subCategory.Subcategory, UseRoactServiceModuleResult))
		end, {
			p1.subCategory,
			UseDispatchResult,
			UseRoactServiceModuleResult
		}),
		LayoutOrder = p1.layoutOrder
	})
end

function SubNavigationBar(Frame)
	-- upvalues: UseTokensFunction (copy), GetAvatarEditorCategoriesModule (copy), UseSelectorFunction (copy), selectCategoryIndex (copy), selectSubcategoryIndex (copy), ReactModule (copy), ResponsiveModule (copy), FoundationModule (copy), SubcategoryPill (copy), FitFrameHorizontal (copy), ScrollingListWithArrowsAndGradientModule (copy)
	local UseTokensResult = UseTokensFunction()
	local AvatarEditorCategoriesModule = GetAvatarEditorCategoriesModule()
	local UseSelectorResult = UseSelectorFunction(selectCategoryIndex)
	local UseSelectorResult1 = UseSelectorFunction(selectSubcategoryIndex)
	local AvatarEditorCategoriesModuleEntry = AvatarEditorCategoriesModule[UseSelectorResult]
	local Subcategories = if AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.ShowSubcategoriesAsSubnavigation then AvatarEditorCategoriesModuleEntry.Subcategories else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.BreakpointConfig.Enum.Portrait
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseRefResult (copy)
		local X = Frame.AbsoluteSize.X or 0
		
		if UseRefResult.current then
			UseRefResult.current.CanvasSize = UDim2.new(0, X, 1, 0)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Subcategories (copy), ReactModule (upval), FoundationModule (upval), UseTokensResult (copy), UseRefResult1 (copy), UseSelectorResult1 (copy), SubcategoryPill (upval), FitFrameHorizontal (upval), UseResult (copy)
		local Elements = {}
		
		if Subcategories then
			local LayoutOrder = 1
			Elements.LeftPadding = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy",
				BackgroundTransparency = 1,
				Size = UDim2.new(0, UseTokensResult.Size.Size_300, 1, 0),
				LayoutOrder = LayoutOrder
			})
			local NewLayoutOrder = LayoutOrder + 1
			
			for i, subcategory in Subcategories do
				if not UseRefResult1.current[i] then
					UseRefResult1.current[i] = ReactModule.createRef()
				end
				Elements[subcategory.Name or tostring(i)] = ReactModule.createElement(SubcategoryPill, {
					subCategory = subcategory,
					isActive = UseSelectorResult1 == i,
					layoutOrder = NewLayoutOrder
				})
				NewLayoutOrder += 1
			end
			Elements.RightPadding = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy",
				BackgroundTransparency = 1,
				Size = UDim2.new(0, UseTokensResult.Size.Size_300, 1, 0),
				LayoutOrder = NewLayoutOrder
			})
		end
		return {
			NavFrame = ReactModule.createElement(FitFrameHorizontal, {
				height = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				BackgroundTransparency = 1,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				[ReactModule.Change.AbsoluteSize] = UseResult,
				contentPadding = UDim.new(0, UseTokensResult.Size.Size_200)
			}, Elements)
		}
	end, {
		Subcategories,
		UseSelectorResult1,
		UseResult,
		UseTokensResult
	})
	
	if AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.ShowSubcategoriesAsSubnavigation then
		local Size1200 = UseTokensResult.Size.Size_1200
		
		return ReactModule.createElement(FoundationModule.View, {
			tag = "clip gui-object-defaults",
			BorderSizePixel = 0,
			LayoutOrder = Frame.LayoutOrder,
			Size = UDim2.new(1, 0, 0, Size1200),
			padding = if IsUseOrientationResultMatch then nil else { top = UDim.new(0, UseTokensResult.Size.Size_250) }
		}, {
			ScrollingListWithArrowsAndGradient = ReactModule.createElement(ScrollingListWithArrowsAndGradientModule, {
				buttonPadding = 0,
				getScollingListContent = UseResult1,
				listHeight = Size1200,
				scrollingFrameRef = UseRefResult,
				buttonRefs = UseRefResult1.current
			})
		})
	else
		return nil
	end
end

return SubNavigationBar