local _ = require("./types")
local _ = require("./control_types")
local MediaSharedModule = require("./media_shared")
local MediaTextModule = require("./media_text")
local MediaImageModule = require("./media_image")
local MediaBadgeModule = require("./media_badge")
local MediaPathModule = require("./media_path")
local MediaProgressModule = require("./media_progress")
local MediaSkeletonModule = require("./media_skeleton")
local MediaAsyncImageModule = require("./media_async_image")
local MediaAvatarModule = require("./media_avatar")
local MediaStageModule = require("./media_stage")

return function(p1, p2)
	-- upvalues: MediaSharedModule (copy), MediaTextModule (copy), MediaImageModule (copy), MediaBadgeModule (copy), MediaPathModule (copy), MediaProgressModule (copy), MediaSkeletonModule (copy), MediaAsyncImageModule (copy), MediaAvatarModule (copy), MediaStageModule (copy)
	local P1 = p2 or {}
	local MediaSharedModuleResult = MediaSharedModule(p1)
	MediaTextModule(p1, P1, MediaSharedModuleResult)
	MediaImageModule(p1, P1, MediaSharedModuleResult)
	MediaBadgeModule(p1, P1, MediaSharedModuleResult)
	MediaPathModule(p1, P1)
	MediaProgressModule(p1, P1, MediaSharedModuleResult)
	MediaSkeletonModule(p1, P1)
	MediaAsyncImageModule(p1, P1, MediaSharedModuleResult)
	MediaAvatarModule(p1, P1)
	MediaStageModule(p1, P1, MediaSharedModuleResult)
	
	return P1
end