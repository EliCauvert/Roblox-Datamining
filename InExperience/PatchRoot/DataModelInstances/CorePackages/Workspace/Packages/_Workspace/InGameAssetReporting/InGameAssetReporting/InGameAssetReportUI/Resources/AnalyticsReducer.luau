local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local _ = require(inGameAssetReporting.InGameAssetReportUI.Resources.Types)
local analyticsActions = require(inGameAssetReporting.InGameAssetReportUI.Resources.Constants).AnalyticsActions

return function(p1, p2)
	-- upvalues: analyticsActions (ref)
	local cloned = table.clone(p1)
	local type = p2.type
	
	if type == analyticsActions.SetPlaceId then
		cloned.place_id = p2.place_id
		
		return cloned
	elseif type == analyticsActions.AccumulateForTimeSpent then
		cloned.accumulated_time_ms = p2.accumulated_time_ms
		
		return cloned
	elseif type == analyticsActions.SetReasonSelection then
		cloned.reason_selection = p2.reason_selection
		
		return cloned
	elseif type == analyticsActions.SetSurfaceSelection then
		cloned.surface_selection = p2.surface_selection
		
		return cloned
	elseif type == analyticsActions.SetPrefilledSurfaceSelection then
		cloned.prefilled_surface_selection = p2.prefilled_surface_selection
		
		return cloned
	elseif type == analyticsActions.SetCommentAdded then
		cloned.comment_added = p2.comment_added
		
		return cloned
	elseif type == analyticsActions.IncrementNextCount then
		cloned.next_count += 1
		
		return cloned
	elseif type == analyticsActions.IncremementAnnotationCount then
		cloned.annotation_place_count += 1
		
		return cloned
	elseif type == analyticsActions.IncremementAnnotationUndoCount then
		cloned.annotation_undo_count += 1
		
		return cloned
	elseif type == analyticsActions.IncremementAnnotationRedoCount then
		cloned.annotation_redo_count += 1
		
		return cloned
	elseif type == analyticsActions.SetExtractionResults then
		local results = p2.results
		cloned.annotation_final_count = p2.final_annotation_count
		cloned.avatar_final_count = results.stats.playersCount
		cloned.image_asset_count = #results.extractedAssets.Image
		cloned.mesh_asset_count = #results.extractedAssets.Mesh
		cloned.model_asset_count = #results.extractedAssets.Model
		cloned.package_asset_count = #results.extractedAssets.Package
		cloned.final_raycast_target_count = results.stats.raycastTargetCount
		cloned.final_raycast_completed_count = results.stats.raycastCompletedCount
		cloned.final_raycast_resumption_count = results.stats.raycastResumptionCount
		cloned.final_raycast_computation_time_us = math.ceil(results.stats.raycastComputeTime * 1000000)
		cloned.hit_count_map_size = results.stats.hitCountMapSize
		cloned.top_level_objects_size = results.stats.topLevelObjectsSize
		cloned.instances_traversed_count = results.stats.instancesTraversed
		cloned.traversal_task_list_size = results.stats.traversalTaskListSize
		cloned.traversal_tasks_completed_count = results.stats.traversalTasksCompleted
		cloned.extraction_resumption_count = results.stats.resumptionCount
		cloned.extraction_computation_time_us = math.ceil(results.stats.computeTime * 1000000)
		cloned.extraction_wall_time_us = math.ceil(results.stats.wallTime * 1000000)
		
		return cloned
	elseif type == analyticsActions.SetViewportInformation then
		cloned.viewport_size_x = p2.viewport_size_x
		cloned.viewport_size_y = p2.viewport_size_y
		cloned.is_portrait_mode = p2.is_portrait_mode
		
		return cloned
	elseif type == analyticsActions.SetDidUserResize then
		cloned.did_user_resize = p2.did_user_resize
		
		return cloned
	elseif type == analyticsActions.SetVariant then
		cloned.variant = p2.variant
	end
	return cloned
end