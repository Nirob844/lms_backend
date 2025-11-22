import { Module } from '@nestjs/common';
import { PrismaModule } from 'src/prisma/prisma.module';
import { LessonUnlockService } from './services/lesson-unlock.service';
import { CourseProgressService } from './services/course-progress.service';
import { LessonProgressService } from './services/lesson-progress.service';

@Module({
    imports: [PrismaModule],
    providers: [
        LessonUnlockService,
        CourseProgressService,
        LessonProgressService,
    ],
    exports: [
        LessonUnlockService,
        CourseProgressService,
        LessonProgressService,
    ],
})
export class SeriesServicesModule { }
