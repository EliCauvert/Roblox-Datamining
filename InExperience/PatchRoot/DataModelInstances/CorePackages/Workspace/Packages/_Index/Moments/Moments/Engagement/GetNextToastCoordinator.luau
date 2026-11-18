local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local MomentsPostNextToastModule = require(Parent.DataHydration.MomentsPostNextToast)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local GetUploadStoreModule = require(Moments.Stores.GetUploadStore)
local GetCommentsSheetStoreModule = require(Moments.Components.Comments.Sheet.getCommentsSheetStore)
local GetExperienceDetailsSheetStoreModule = require(Moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local CreateNextToastCoordinatorModule = require(script.createNextToastCoordinator)
local FFlagMomentsCreatorAnalyticsModule = require(Moments.Flags.FFlagMomentsCreatorAnalytics)
local GetPostStatusCardStoreModule = if require(Parent.SharedFlags).FFlagMomentsPostFeedback then require(Moments.Stores.GetPostStatusCardStore) else nil
local GetPostInsightsPageStoreModule = if FFlagMomentsCreatorAnalyticsModule then require(Moments.Components.PostInsights.getPostInsightsPageStore) else nil

local function createSessionCoordinator()
	-- upvalues: GetToastStoreModule (copy), GetUploadStoreModule (copy), GetCommentsSheetStoreModule (copy), GetExperienceDetailsSheetStoreModule (copy), GetPostInsightsPageStoreModule (copy), GetPostStatusCardStoreModule (copy), CreateNextToastCoordinatorModule (copy), MomentsPostNextToastModule (copy)
	local ToastStoreModule = GetToastStoreModule(false)
	local UploadStoreModule = GetUploadStoreModule(false)
	local CommentsSheetStoreModule = GetCommentsSheetStoreModule(false)
	local ExperienceDetailsSheetStoreModule = GetExperienceDetailsSheetStoreModule(false)
	local PostInsightsPageStoreModule = if GetPostInsightsPageStoreModule == nil then nil else GetPostInsightsPageStoreModule(false)
	local PostStatusCardStoreModule = if GetPostStatusCardStoreModule == nil then nil else GetPostStatusCardStoreModule(false)
	local Success, Result = pcall(function()
		return game:GetService("AppLifecycleObserverService")
	end)
	
	return CreateNextToastCoordinatorModule({
		postNextToast = MomentsPostNextToastModule,
		getHasOtherToast = function(p1): boolean
			-- upvalues: ToastStoreModule (copy), PostStatusCardStoreModule (copy)
			local v1: boolean = PostStatusCardStoreModule ~= nil and #PostStatusCardStoreModule.getCards(p1) > 0
			
			return #ToastStoreModule.getToasts(p1) > 0 or v1
		end,
		getIsUploading = function(p1): boolean
			-- upvalues: UploadStoreModule (copy)
			return UploadStoreModule.getState(p1) == "Uploading"
		end,
		getIsCoveringSheetOpen = function(p1)
			-- upvalues: CommentsSheetStoreModule (copy), ExperienceDetailsSheetStoreModule (copy), PostInsightsPageStoreModule (copy)
			local IsOpen = ExperienceDetailsSheetStoreModule.getIsOpen(p1)
			local IsOpen1 = PostInsightsPageStoreModule ~= nil and PostInsightsPageStoreModule.getIsOpen(p1)
			
			return CommentsSheetStoreModule.getIsOpen(p1) or (IsOpen or IsOpen1)
		end,
		onAppHidden = if Success then Result.OnHide else nil,
		onAppShown = if Success then Result.OnUnhide else nil
	})
end

return SignalsModule.createComputed(function(_)
	-- upvalues: createSessionCoordinator (copy)
	return createSessionCoordinator()
end)