local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local _ = require(InGameAssetReporting.InGameAssetReportUI.Resources.Types)
local AnalyticsActions = require(InGameAssetReporting.InGameAssetReportUI.Resources.Constants).AnalyticsActions

return function(Tbl, p1) --[[ Line: 8 | Named "analyticsReducer" ]]
	-- upvalues: AnalyticsActions (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	
	if Type == AnalyticsActions.SetPlaceId then
		Copy.place_id = p1.place_id
		
		return Copy
	end
	if Type == AnalyticsActions.AccumulateForTimeSpent then
		Copy.accumulated_time_ms = p1.accumulated_time_ms
		
		return Copy
	end
	if Type == AnalyticsActions.SetReasonSelection then
		Copy.reason_selection = p1.reason_selection
		
		return Copy
	end
	if Type == AnalyticsActions.SetSurfaceSelection then
		Copy.surface_selection = p1.surface_selection
		
		return Copy
	end
	if Type == AnalyticsActions.SetPrefilledSurfaceSelection then
		Copy.prefilled_surface_selection = p1.prefilled_surface_selection
		
		return Copy
	end
	if Type == AnalyticsActions.SetCommentAdded then
		Copy.comment_added = p1.comment_added
		
		return Copy
	end
	if Type == AnalyticsActions.IncrementNextCount then
		Copy.next_count += 1
		
		return Copy
	end
	if Type == AnalyticsActions.IncremementAnnotationCount then
		Copy.annotation_place_count += 1
		
		return Copy
	end
	if Type == AnalyticsActions.IncremementAnnotationUndoCount then
		Copy.annotation_undo_count += 1
		
		return Copy
	end
	if Type == AnalyticsActions.IncremementAnnotationRedoCount then
		Copy.annotation_redo_count += 1
		
		return Copy
	end
	if Type == AnalyticsActions.SetExtractionResults then
		local Results = p1.results
		Copy.annotation_final_count = p1.final_annotation_count
		Copy.avatar_final_count = Results.stats.playersCount
		Copy.image_asset_count = #Results.extractedAssets.Image
		Copy.mesh_asset_count = #Results.extractedAssets.Mesh
		Copy.model_asset_count = #Results.extractedAssets.Model
		Copy.package_asset_count = #Results.extractedAssets.Package
		Copy.final_raycast_target_count = Results.stats.raycastTargetCount
		Copy.final_raycast_completed_count = Results.stats.raycastCompletedCount
		Copy.final_raycast_resumption_count = Results.stats.raycastResumptionCount
		Copy.final_raycast_computation_time_us = math.ceil(Results.stats.raycastComputeTime * 1000000)
		Copy.hit_count_map_size = Results.stats.hitCountMapSize
		Copy.top_level_objects_size = Results.stats.topLevelObjectsSize
		Copy.instances_traversed_count = Results.stats.instancesTraversed
		Copy.traversal_task_list_size = Results.stats.traversalTaskListSize
		Copy.traversal_tasks_completed_count = Results.stats.traversalTasksCompleted
		Copy.extraction_resumption_count = Results.stats.resumptionCount
		Copy.extraction_computation_time_us = math.ceil(Results.stats.computeTime * 1000000)
		Copy.extraction_wall_time_us = math.ceil(Results.stats.wallTime * 1000000)
		
		return Copy
	else
		if Type == AnalyticsActions.SetViewportInformation then
			Copy.viewport_size_x = p1.viewport_size_x
			Copy.viewport_size_y = p1.viewport_size_y
			Copy.is_portrait_mode = p1.is_portrait_mode
			
			return Copy
		end
		if Type == AnalyticsActions.SetDidUserResize then
			Copy.did_user_resize = p1.did_user_resize
			
			return Copy
		end
		if Type == AnalyticsActions.SetVariant then
			Copy.variant = p1.variant
		end
		return Copy
	end
end