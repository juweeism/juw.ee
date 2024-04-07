import { z, defineCollection } from 'astro:content';

const nowCollection = defineCollection({
    type: 'content', // v2.5.0 and later
    schema: z.object({
        title: z.string(),
        day: z.string(),
    }),
});

export const collections = {
    'now': nowCollection,
};
