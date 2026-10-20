local Schools = script:FindFirstAncestor("Schools")
local TextKeysModule = require(Schools.Common.TextKeys)
local EnumsModule = require(Schools.Common.Enums)
local StageIcon = {
	Verified = "Verified",
	Pending = "Pending",
	Badge = "Badge",
	Classmates = "Classmates",
	Trends = "Trends"
}

return {
	StageIcon = StageIcon,
	byVariant = {
		[EnumsModule.SchoolWaitlistVariant.School] = {
			hasShareMedia = true,
			bodyKey = TextKeysModule.WaitlistBody,
			shareTitleKey = TextKeysModule.ShareBannerTitle,
			shareBodyKey = TextKeysModule.ShareBannerBody,
			stages = {
				{
					icon = StageIcon.Verified,
					titleKey = TextKeysModule.StageVerifiedTitle
				},
				{
					usesCount = true,
					icon = StageIcon.Pending,
					titleKey = TextKeysModule.StageUnlockTitle,
					bodyKey = TextKeysModule.StageUnlockBody
				},
				{
					dimmed = true,
					icon = StageIcon.Badge,
					titleKey = TextKeysModule.StageBadgeTitle,
					bodyKey = TextKeysModule.StageBadgeBody
				},
				{
					dimmed = true,
					icon = StageIcon.Classmates,
					titleKey = TextKeysModule.StageClassmatesTitle,
					bodyKey = TextKeysModule.StageClassmatesBody
				},
				{
					dimmed = true,
					icon = StageIcon.Trends,
					titleKey = TextKeysModule.StageTrendsTitle,
					bodyKey = TextKeysModule.StageTrendsBody
				}
			}
		},
		[EnumsModule.SchoolWaitlistVariant.Alumni] = {
			hasShareMedia = false,
			bodyKey = TextKeysModule.WaitlistAlumniBody,
			shareTitleKey = TextKeysModule.ShareBannerTitle,
			shareBodyKey = TextKeysModule.ShareBannerAlumniBody,
			stages = {
				{
					icon = StageIcon.Verified,
					titleKey = TextKeysModule.StageVerifiedTitle
				},
				{
					icon = StageIcon.Pending,
					titleKey = TextKeysModule.StageUnlockAlumniTitle,
					bodyKey = TextKeysModule.StageUnlockAlumniBody
				},
				{
					dimmed = true,
					icon = StageIcon.Badge,
					titleKey = TextKeysModule.StageBadgeAlumniTitle,
					bodyKey = TextKeysModule.StageBadgeAlumniBody
				},
				{
					dimmed = true,
					icon = StageIcon.Classmates,
					titleKey = TextKeysModule.StageClassmatesTitle,
					bodyKey = TextKeysModule.StageClassmatesAlumniBody
				},
				{
					dimmed = true,
					icon = StageIcon.Trends,
					titleKey = TextKeysModule.StageTrendsAlumniTitle,
					bodyKey = TextKeysModule.StageTrendsAlumniBody
				}
			}
		}
	}
}