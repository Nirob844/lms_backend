export interface CourseFileData {
    courseIndex: number;
    lessonFiles?: Express.Multer.File[];
}

export const parseCourseFiles = (
    req: any,
    courseCount: number
): CourseFileData[] => {
    const result: CourseFileData[] = [];

    for (let i = 0; i < courseCount; i++) {
        const lessonKey = `courseFiles[${i}].lessonFiles`;

        const courseData: CourseFileData = { courseIndex: i };

        if (req.files[lessonKey]) {
            courseData.lessonFiles = req.files[lessonKey];
        }

        result.push(courseData);
    }

    return result;
};
