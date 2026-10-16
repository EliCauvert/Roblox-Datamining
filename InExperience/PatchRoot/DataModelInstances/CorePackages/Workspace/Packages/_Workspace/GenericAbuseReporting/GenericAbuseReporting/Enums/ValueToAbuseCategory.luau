local AbuseCategoryModule = require(script:FindFirstAncestor("GenericAbuseReporting").Enums.AbuseCategory)

return {
	[0] = AbuseCategoryModule.ABUSE_CATEGORY_INVALID,
	[1] = AbuseCategoryModule.ABUSE_CATEGORY_SWEARING,
	[2] = AbuseCategoryModule.ABUSE_CATEGORY_BULLYING,
	[3] = AbuseCategoryModule.ABUSE_CATEGORY_SCAMMING,
	[4] = AbuseCategoryModule.ABUSE_CATEGORY_DATING,
	[5] = AbuseCategoryModule.ABUSE_CATEGORY_CHEATING,
	[6] = AbuseCategoryModule.ABUSE_CATEGORY_INAPT_CONTENT,
	[7] = AbuseCategoryModule.ABUSE_CATEGORY_INAPPROPRIATE_USERNAME,
	[8] = AbuseCategoryModule.ABUSE_CATEGORY_OFFSITE_LINKS,
	[9] = AbuseCategoryModule.ABUSE_CATEGORY_PERSONAL_QUESTION,
	[10] = AbuseCategoryModule.ABUSE_CATEGORY_INAPPROPRIATE_LANGUAGE_PROFANITY_AND_ADULT_CONTENT,
	[11] = AbuseCategoryModule.ABUSE_CATEGORY_EXPLOITING_CHEATING_SCAMMING,
	[12] = AbuseCategoryModule.ABUSE_CATEGORY_ACCOUNT_THEFT,
	[13] = AbuseCategoryModule.ABUSE_CATEGORY_REAL_LIFE_THREATS_AND_SUICIDE_THREATS,
	[14] = AbuseCategoryModule.ABUSE_CATEGORY_INACCURATE_AGE_GUIDELINES,
	[15] = AbuseCategoryModule.ABUSE_CATEGORY_OTHER,
	[16] = AbuseCategoryModule.ABUSE_CATEGORY_SPAMMING,
	[18] = AbuseCategoryModule.ABUSE_CATEGORY_HATE_SPEECH,
	[24] = AbuseCategoryModule.ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM
}